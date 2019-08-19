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
Plug 'tpope/vim-repeat'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'sophacles/vim-processing'
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Themes
Plug 'drewtempelmeyer/palenight.vim'

" Multiple
Plug 'sheerun/vim-polyglot'
Plug 'sbdchd/neoformat'

call plug#end()

" indent lines
"let g:indentLine_setColors = 1
"let g:indentLine_char = '▎'
"let g:indentLine_color_gui = '#141B21'

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" CoC
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" color schemes
set background=dark
colorscheme palenight
set fillchars+=vert:·

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

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFocus<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Easy Motion
map s <Plug>(easymotion-bd-w)
map <s-s> <Plug>(easymotion-overwin-w)

" set ag as the grep program
if executable('rg')
  set grepprg=rg\ --vimgrep
endif

" VISTA VISTA VISTA VISTA VISTA VISTA VISTA VISTA VISTA VISTA VISTA
nmap <leader>v :Vista<CR>
let g:vista_sidebar_width = 45
let g:vista_disable_statusline = 1
let g:vista_default_executive = 'coc'

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1
let g:vista_icon_indent = ["▸ ", ""]

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794 ",
\   "module": "\uf6a6 ",
\   "variable": "\ufb18 "
\  }

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" VISTA VISTA VISTA VISTA VISTA VISTA VISTA VISTA VISTA VISTA VISTA

" deoplete
"let g:deoplete#enable_at_startup = 1
"inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <silent><expr> <S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"






" CoC CoC CoC CoC CoC CoC CoC CoC CoC CoC
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
"set nobackup
"set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
