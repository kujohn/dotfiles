" ---------------------------------------------------------------
" PLUGINS PLUGINS PLUGINS PLUGINS PLUGINS PLUGINS PLUGINS PLUGINS
" ---------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-repeat'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'sophacles/vim-processing'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'sbdchd/neoformat'
Plug 'ryanoasis/vim-devicons'
call plug#end()
