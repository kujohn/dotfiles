#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Global variables
SOURCE_DIR=""
DEST_DIR=""
FSWATCH_PID=""
CHECKSUM_FILE=""

# Function to print colored output
print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to show usage
usage() {
    echo "Usage: $0 <source_directory> <destination_directory>"
    echo ""
    echo "Syncs .glsl and .metal files between directories:"
    echo "  1. Copies all shader files from source to destination at startup"
    echo "  2. Watches destination for changes and syncs back to source"
    echo "  3. Removes destination directory on exit"
    echo ""
    echo "Requirements: fswatch (install with: brew install fswatch)"
    exit 1
}

# Function to check if fswatch is available
check_fswatch() {
    if ! command -v fswatch &> /dev/null; then
        print_error "fswatch is required but not installed"
        echo "Install with: brew install fswatch"
        exit 1
    fi
}

# Function to validate directories
validate_dirs() {
    if [[ ! -d "$SOURCE_DIR" ]]; then
        print_error "Source directory '$SOURCE_DIR' does not exist"
        exit 1
    fi
    
    # Convert to absolute paths
    SOURCE_DIR=$(cd "$SOURCE_DIR" && pwd)
    DEST_DIR=$(mkdir -p "$DEST_DIR" && cd "$DEST_DIR" && pwd)
    
    # Create checksum file in destination
    CHECKSUM_FILE="$DEST_DIR/.shader_checksums"
    
    print_info "Source: $SOURCE_DIR"
    print_info "Destination: $DEST_DIR"
}

# Function to copy shader files from source to destination
initial_copy() {
    print_info "Starting initial copy of shader files..."
    
    local count=0
    
    # Find and copy .glsl files
    while IFS= read -r -d '' file; do
        local rel_path="${file#$SOURCE_DIR/}"
        local dest_file="$DEST_DIR/$rel_path"
        local dest_dir=$(dirname "$dest_file")
        
        mkdir -p "$dest_dir"
        cp "$file" "$dest_file"
        # Store checksum of copied file
        local checksum=$(shasum -a 256 "$dest_file" | cut -d' ' -f1)
        echo "$dest_file:$checksum" >> "$CHECKSUM_FILE"
        print_info "Copied: $rel_path"
        ((count++))
    done < <(find "$SOURCE_DIR" -name "*.glsl" -type f -print0 2>/dev/null || true)
    
    # Find and copy .metal files
    while IFS= read -r -d '' file; do
        local rel_path="${file#$SOURCE_DIR/}"
        local dest_file="$DEST_DIR/$rel_path"
        local dest_dir=$(dirname "$dest_file")
        
        mkdir -p "$dest_dir"
        cp "$file" "$dest_file"
        # Store checksum of copied file
        local checksum=$(shasum -a 256 "$dest_file" | cut -d' ' -f1)
        echo "$dest_file:$checksum" >> "$CHECKSUM_FILE"
        print_info "Copied: $rel_path"
        ((count++))
    done < <(find "$SOURCE_DIR" -name "*.metal" -type f -print0 2>/dev/null || true)
    
    print_info "Initial copy complete: $count files copied"
}

# Function to get stored checksum for a file
get_stored_checksum() {
    local file="$1"
    if [[ -f "$CHECKSUM_FILE" ]]; then
        grep "^$file:" "$CHECKSUM_FILE" 2>/dev/null | cut -d':' -f2
    fi
}

# Function to update stored checksum for a file
update_stored_checksum() {
    local file="$1"
    local new_checksum="$2"
    
    if [[ -f "$CHECKSUM_FILE" ]]; then
        # Remove old entry and add new one
        grep -v "^$file:" "$CHECKSUM_FILE" > "$CHECKSUM_FILE.tmp" 2>/dev/null || true
        echo "$file:$new_checksum" >> "$CHECKSUM_FILE.tmp"
        mv "$CHECKSUM_FILE.tmp" "$CHECKSUM_FILE"
    fi
}

# Function to sync a file back to source
sync_file_back() {
    local changed_file="$1"
    
    # Skip if file doesn't exist (might have been deleted)
    [[ ! -f "$changed_file" ]] && return
    
    # Check if it's a shader file
    if [[ "$changed_file" =~ \.(glsl|metal)$ ]]; then
        # Calculate current checksum
        local current_checksum=$(shasum -a 256 "$changed_file" | cut -d' ' -f1)
        local stored_checksum=$(get_stored_checksum "$changed_file")
        
        # Only sync if file has actually changed
        if [[ "$current_checksum" != "$stored_checksum" ]]; then
            local rel_path="${changed_file#$DEST_DIR/}"
            local source_file="$SOURCE_DIR/$rel_path"
            local source_dir=$(dirname "$source_file")
            
            # Create source directory if needed
            mkdir -p "$source_dir"
            
            # Copy file back to source
            if cp "$changed_file" "$source_file"; then
                # Update stored checksum
                update_stored_checksum "$changed_file" "$current_checksum"
                print_info "Synced back: $rel_path"
            else
                print_error "Failed to sync: $rel_path"
            fi
        fi
    fi
}

# Function to start file watching
start_watching() {
    print_info "Starting file watcher on $DEST_DIR"
    print_info "Watching for changes... Press Ctrl+C to exit"
    
    # Use fswatch to monitor the destination directory with minimal latency
    fswatch -r -e ".*" -i "\\.glsl$" -i "\\.metal$" --latency=0.1 "$DEST_DIR" | while read -r changed_file; do
        sync_file_back "$changed_file"
    done &
    
    FSWATCH_PID=$!
    
    # Wait for fswatch process
    wait $FSWATCH_PID
}

# Cleanup function
cleanup() {
    print_info "Shutting down..."
    
    # Kill fswatch if running
    if [[ -n "$FSWATCH_PID" ]]; then
        kill $FSWATCH_PID 2>/dev/null || true
        wait $FSWATCH_PID 2>/dev/null || true
    fi
    
    # Remove destination directory
    if [[ -d "$DEST_DIR" ]]; then
        rm -rf "$DEST_DIR"
        print_info "Removed destination directory: $DEST_DIR"
    fi
    
    exit 0
}

# Main function
main() {
    # Check arguments
    if [[ $# -ne 2 ]]; then
        usage
    fi
    
    SOURCE_DIR="$1"
    DEST_DIR="$2"
    
    # Set up cleanup trap
    trap cleanup SIGINT SIGTERM EXIT
    
    # Validate requirements and directories
    check_fswatch
    validate_dirs
    
    # Perform initial copy first
    initial_copy
    
    # Start watching for changes
    start_watching
}

# Run main function with all arguments
main "$@"