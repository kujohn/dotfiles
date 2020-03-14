syntax enable

highlight Comment cterm=italic
hi link xmlEndTag xmlTag
hi htmlArg gui=italic
hi Comment gui=italic
hi Type gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type cterm=italic

"  Italic
let &t_8f="\<Esc>[38;2%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set encoding=UTF-8
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
let g:indentLine_char = '·'
filetype plugin indent on
syntax on
autocmd BufWritePre * :%s/\s\+$//e
au FileType * setlocal formatoptions-=cro
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.styl set filetype=css

let mapleader=","

let g:go_fmt_command = "goimports"
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>i <Plug>(go-info)
"au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)


" vim-fireplace
au Filetype clojure nmap <Leader>r :Require<cr>
au Filetype clojure nmap <Leader>R :Require!<cr>

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
"let g:ale_sign_error = '▶'
"let g:ale_sign_warning = '჻'
"highlight ALEErrorSign guibg=NONE guifg=red ctermbg=NONE ctermfg=red
"highlight ALEWarningSign guibg=NONE guifg=red ctermbg=NONE ctermfg=red
"let g:ale_lint_on_enter = 1

" FZF, Searches
nmap <leader>f :FZF<CR>
nmap <leader>s :Ag<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>t :Buffers<CR>

" Easy Motion
nmap z <Plug>(easymotion-bd-w)
nmap Z <Plug>(easymotion-overwin-w)

" set ag as the grep program
if executable('rg')
  set grepprg=rg\ --vimgrep
endif

let g:lightline = {
      \ 'colorscheme': 'embark',
      \ 'active': {
      \   'left': [['filename']],
      \   'right': []
      \ },
      \ 'inactive': {
      \ 'left': [['filename']],
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
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 0
highlight link SignifyLineChange DiffText
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=2 guifg=#009900
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=1 guifg=#ff2222
highlight DiffChange        cterm=bold ctermbg=none ctermfg=3 guifg=#bbbb00
highlight SignifySignAdd    cterm=bold ctermbg=none ctermfg=2 guifg=#009900
highlight SignifySignDelete cterm=bold ctermbg=none ctermfg=1 guifg=#ff2222
highlight SignifySignChange cterm=bold ctermbg=none ctermfg=3 guifg=#bbbb00
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = g:signify_sign_change


" deoplete SECTION
set hidden
let g:deoplete#enable_at_startup = 1
let g:autocomplete_flow#insert_paren_after_function = 0
call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
let g:LanguageClient_serverCommands = {
  \ 'go': ['gopls'],
  \ 'css': ['css-languageserver',  '--stdio'],
  \ 'less': ['css-languageserver',  '--stdio'],
  \ 'sass': ['css-languageserver',  '--stdio'],
  \ 'stylus': ['css-languageserver',  '--stdio'],
  \ 'javascript': ['typescript-language-server',  '--stdio'],
  \ 'javascript.jsx': ['typescript-language-server',  '--stdio'],
  \ 'typescript': ['typescript-language-server',  '--stdio'],
  \ 'typescript.tsx': ['typescript-language-server',  '--stdio'],
  \ 'clojure': ['bash', '-c', 'clojure-lsp'],
  \ }

let g:clj_fmt_autosave = 0
nnoremap <leader>c :Cljfmt<CR>
nnoremap <leader>m :make<CR>
nnoremap <F2> :call LanguageClient_contextMenu()<CR>
nnoremap <silent><leader>h :call LanguageClient#textDocument_references()<CR>
nnoremap <silent><leader>dd :call LanguageClient_contextMenu()<CR>
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <s-TAB>  pumvisible() ? "\<C-p>" : "\<s-TAB>"


if has('win32') || has('win64')
  Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
else
  Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
endif

"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces


" Jump to definition under cursore
" Normal mode: Jump to definition under cursore
"nnoremap <leader>j :AnyJump<CR>
"
"" Visual mode: jump to selected text in visual mode
"xnoremap <leader>j :AnyJumpVisual<CR>
"
"" Normal mode: open previous opened file (after jump)
"nnoremap <leader>ab :AnyJumpBack<CR>
"
"" Normal mode: open last closed search window again
"nnoremap <leader>al :AnyJumpLastResults<CR>
