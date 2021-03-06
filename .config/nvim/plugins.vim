" ---------------------------------------------------------------
" PLUGINS PLUGINS PLUGINS PLUGINS PLUGINS PLUGINS PLUGINS PLUGINS
" ---------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'mhinz/vim-signify'
Plug 'kshenoy/vim-signature'
"Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sbdchd/neoformat'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
" Plug 'baverman/vial'
" Plug 'baverman/vial-http'
Plug 'vim-syntastic/syntastic'
"Plug 'thaerkh/vim-workspace'
Plug 'vim-ctrlspace/vim-ctrlspace'

" Themes
Plug 'skbolton/embark'
Plug 'franbach/miramare'
Plug 'arcticicestudio/nord-vim'

" Clojure
"Plug 'venantius/vim-cljfmt'
"Plug 'tpope/vim-fireplace'
"Plug 'tpope/vim-salve'
"Plug 'vim-scripts/paredit.vim'
"Plug 'venantius/vim-eastwood'

" Language Server
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
" Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

call plug#end()
