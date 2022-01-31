syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set nowrap
set smartcase
set noswapfile
set nobackup
"undo directory
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=100
set wildmenu
highlight ColorColumn ctermbg=0 guibg=lightgrey


"VimPlug..."
"Autoinstall (if anything gets fucked up...)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"""Plugins"""
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-utils/vim-man'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
"Plug 'valloric/youcompleteme'
"Plug 'tpope/vim-surround'

call plug#end()

"Plugin Config:
"-ayu
set termguicolors
let ayucolor='dark'
colorscheme ayu

"-devicons
set encoding=UTF-8

"-ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn)$',
\ 'file': '\v\.(exe|so|dll)$',
\ 'link': 'some_bad_symbolic_links',
\ }

"""Keybindings"""
"The LEADER key
let mapleader="\<Space>"

"semicolon for commands
nnoremap ; :

"basic functions
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

""""CocAutocompletion
"Coc-snippets

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>r <Plug>(coc-rename)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"""nerdcommenter
nmap <leader>/ <plug>NERDCommenterToggle
vmap <leader>/ <plug>NERDCommenterToggle

"toggle file browser
nnoremap <leader>n :NERDTreeToggle<CR>

"toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>

"exit insert mode
inoremap <C-s> <C-o>:w<CR><ESC>

"navigation type stuff ig
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"splitting and resizing
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 75<CR>
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

"Launch terminal
nnoremap <leader>t :below vertical terminal<CR>

"Run fiel??
nnoremap <leader>b :!make<CR>

"""Basic navigation in INSERT mode
"INFO: use Ctrl-V before typing a Ctrl-Key to show actual key stroke
"
" Map Ctrl-Backspace to delete the previous word in insert mode.
imap  <C-W>

" Ctrl-Enter to create newline below
imap <C-CR> <C-o>o
