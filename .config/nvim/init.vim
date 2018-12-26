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
au FileType go nmap <leader>t <Plug>(go-test)
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
Plug 'rizzatti/dash.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'briandoll/change-inside-surroundings.vim'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'kylef/apiblueprint.vim'

"Plug 'maralla/completor.vim'
" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'

" Javascript
Plug 'https://github.com/othree/javascript-libraries-syntax.vim', { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug 'thinca/vim-textobj-function-javascript',    { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug '1995eaton/vim-better-javascript-completion', { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug 'chemzqm/vim-jsx-improve', { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug 'gavocanov/vim-js-indent', { 'for': [ 'javascript', 'js', 'jsx' ]}

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'wokalski/autocomplete-flow'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'
let g:neosnippet#enable_completed_snippet = 1
" ---------------------------------------------------------------
" PLUGINS PLUGINS PLUGINS PLUGINS PLUGINS PLUGINS PLUGINS PLUGINS
" ---------------------------------------------------------------

" ---------------------------------------------------------------
" THEMES THEMES THEMES THEMES THEMES THEMES THEMES THEMES THEMES
" ---------------------------------------------------------------

" indent lines
let g:indentLine_setColors = 1
let g:indentLine_char = '▎'
let g:indentLine_color_gui = '#141B21'

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

"" " color schemes
hi VertSplit cterm=NONE ctermbg=NONE ctermfg=black
set fillchars+=vert:·

" git gutter colors
highlight clear SignColumn

set background=dark
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
" colorscheme palenight

" ALE
let g:ale_sign_error = '▶'
let g:ale_sign_warning = '჻'
highlight ALEErrorSign guibg=NONE guifg=red ctermbg=NONE ctermfg=red
highlight ALEWarningSign guibg=NONE guifg=red ctermbg=NONE ctermfg=red

" ---------------------------------------------------------------
" THEMES THEMES THEMES THEMES THEMES THEMES THEMES THEMES THEMES
" ---------------------------------------------------------------
let g:ale_lint_delay = 350
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0

" deoplete disable preview
set completeopt-=preview

nmap <silent> <leader>d <Plug>DashSearch
nmap <leader>f :FZF<CR>
nmap <leader>s :Ag<Cr>

map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFocus<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

map s <Plug>(easymotion-bd-w)

" Tab Completor
"let g:completor_node_binary = '~/.nvm/versions/node/v11.0.0/bin/node'
"let g:completor_gocode_binary = '~/go/bin/gocode'
"let g:completor_filetype_map = {'javascript.jsx': 'javascript'}
"let g:completor_html_omni_trigger = '<\\/'
"let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
"let g:completor_blacklist = ['hosts', 'gitcommit']
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"


" tab for deoplete
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
