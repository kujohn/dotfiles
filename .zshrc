alias k='kubectl'
alias kc='kubectx'
alias ll='lsd -la --icon=never'
alias ls='lsd --icon=never'
alias l='lsd -la --icon=never'
alias commit='git add -p; git commit -n'
alias push='git push origin head'
alias alias ..="cd .."
alias x="hx"
alias tarmac-dev="xcode-build-server config -project Tarmac/*.xcodeproj -scheme Tarmac-Dev"
alias tarmac-uat="xcode-build-server config -project Tarmac/*.xcodeproj -scheme Tarmac-UAT"

export DPRINT_INSTALL="/Users/johnku/.dprint"
export PATH="$DPRINT_INSTALL/bin:$PATH"
export PYTHON="/opt/homebrew/bin/python3"
export HELIX_RUNTIME=~/src/helix/runtime
export EDITOR="hx"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ :$PATH: == *:$HOME/bin:* ]] || PATH=$HOME/bin:$PATH

export PATH="$HOME/go/bin:$HOME/.yarn/bin:$HOME/bin:$HOME/.volta/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

fpath+=("$(brew --prefix)/share/zsh/site-functions")

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
# zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
# zinit light sindresorhus/pure
zinit load zdharma-continuum/history-search-multi-word
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light Aloxaf/fzf-tab

if [ -d ~/.bash_completion.d ]; then
  for file in ~/.bash_completion.d/*; do
    . $file
  done
fi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

source <(capri --zsh-completions 2>/dev/null)
source <(isc --zsh-completions 2>/dev/null)
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
