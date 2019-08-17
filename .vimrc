set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set ruler
set number
set autoindent
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set nowrap
set backspace=2
set scrolloff=6
set sidescrolloff=15
set sidescroll=1
set hlsearch
set equalalways
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

autocmd BufWritePre * :%s/\s\+$//e
au FileType * setlocal formatoptions-=cro
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.styl set filetype=css

" DISABLE FOLDING set nofoldenable
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
"au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
map <Leader>cd :cd %:p:h<CR>
map <Leader>g :GoDoc

" ---------------------------------------------------------------
" PLUGINS PLUGINS PLUGINS PLUGINS PLUGINS PLUGINS PLUGINS PLUGINS
" ---------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'briandoll/change-inside-surroundings.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sophacles/vim-processing'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'

" Multiple
Plug 'sheerun/vim-polyglot'
Plug 'sbdchd/neoformat'

call plug#end()

" indent lines
let g:indentLine_setColors = 1
let g:indentLine_char = '▎'
let g:indentLine_color_gui = '#141B21'

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" CoC
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" color schemes
hi VertSplit cterm=NONE ctermbg=NONE ctermfg=black
set fillchars+=vert:·
highlight clear SignColumn
set background=dark
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
set cursorline

" ALE
let g:ale_sign_error = '▶'
let g:ale_sign_warning = '჻'
highlight ALEErrorSign guibg=NONE guifg=red ctermbg=NONE ctermfg=red
highlight ALEWarningSign guibg=NONE guifg=red ctermbg=NONE ctermfg=red
let g:ale_lint_delay = 350
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0

" FZF, Searches
nmap <leader>f :FZF<CR>
nmap <leader>s :Ag<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>t :Buffers<CR>

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFocus<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Easy Motion
map s <Plug>(easymotion-bd-w)
map <s-s> <Plug>(easymotion-overwin-w)

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

