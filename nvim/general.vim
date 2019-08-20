syntax enable

" Colors and styling {{{
highlight Comment cterm=italic
hi link xmlEndTag xmlTag
hi htmlArg gui=italic
hi Comment gui=italic
hi Type gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type cterm=italic
"  Italic garbage
let &t_8f="\<Esc>[38;2%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
"}}}

" UI Config {{{
set encoding=UTF-8
" Give us a realtime preview of substitution before we send it
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
"set cursorline
let g:indentLine_char = '·'
filetype plugin indent on
syntax on
"}}}
"
autocmd BufWritePre * :%s/\s\+$//e
au FileType * setlocal formatoptions-=cro
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.styl set filetype=css

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

" Searching {{{
set incsearch
set hlsearch
set smartcase
set ignorecase
" }}}

" Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
" }}}

set nobackup
set nowritebackup
set noswapfile
set hidden
set history=100
set path+=**
set splitbelow
set splitright
set diffopt=vertical
set fillchars+=vert:·

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" ALE
let g:ale_sign_error = '▶'
let g:ale_sign_warning = '჻'
highlight ALEErrorSign guibg=NONE guifg=red ctermbg=NONE ctermfg=red
highlight ALEWarningSign guibg=NONE guifg=red ctermbg=NONE ctermfg=red
let g:ale_lint_delay = 350

" FZF, Searches
nmap <leader>f :FZF<CR>
nmap <leader>s :Ag<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>t :Buffers<CR>

" Easy Motion
nmap s <Plug>(easymotion-bd-w)
nmap S <Plug>(easymotion-overwin-w)

" set ag as the grep program
if executable('rg')
  set grepprg=rg\ --vimgrep
endif

let g:lightline = {
      \ 'colorscheme': 'embark',
      \ 'active': {
      \   'left': [ [ 'filename' ]],
      \   'right': []
      \ },
      \ 'inactive': {
      \ 'left': [ [ 'filename' ] ],
      \ 'right': []
      \ }
      \ }

" theme
colorscheme embark
hi Cursor guibg=#F48FB1 guifg=white
if has("gui_vimr")
else
  hi Normal guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
endif
highlight GitGutterAdd    guifg=#009900 guibg=NONE ctermfg=2 ctermbg=NONE
highlight GitGutterChange guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=NONE
highlight GitGutterDelete guifg=#ff2222 guibg=NONE ctermfg=1 ctermbg=NONE
