" Vim config
"
" Maintainer: Daisy Smith <daisymarie128@gmail.com>

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

syntax on
set smartindent
set hlsearch
set incsearch " search as characters are entered

set number
set cursorline  " highlight current line

" Save swap files into seperate folder
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

set clipboard=unnamed " use os clipboard
set foldmethod=indent
set foldlevel=20

set shiftwidth=2 " number of spaces when shift indenting
set tabstop=2 " number of visual spaces per tab
set softtabstop=2 " number of spaces in tab when editing

let g:airline_theme = 'mine' 
let g:airline_powerline_fonts = 1
set t_Co=256
:set termguicolors


" if has('termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif

"=================
" Code syntax
" ================

let g:javascript_plugin_jsdoc = 1

"==================
" KEY BINDINGS
" ================

let mapleader = "\<Space>"
nnoremap <leader>o o<Esc>
nnoremap <leader>o o<Esc>
nnoremap x "_x
nnoremap <Leader>q :Bdelete<CR>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
if has('nvim')
nmap <BS> <C-W>h
endif

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Search regex in multiple files
:nnoremap gR :grep "\<<cword>\>" *<CR>
:nnoremap GR :grep "\<<cword>\>" %:p:h/*<CR>

"=======================
" Multi cursor
" ====================

let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"==================
" Nerdtree
" ================

:set modifiable
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeMouseMode=2
let NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore = ['\.pyc$']
noremap <leader>f :NERDTreeToggle<CR>

" prevent buffer next, previous and delete when focused on Nerdtree
autocmd FileType nerdtree nnoremap <buffer> <Tab> <nop>
autocmd FileType nerdtree nnoremap <buffer> <S-Tab> <nop>
autocmd FileType nerdtree nnoremap <buffer> <C-q> :NERDTreeToggle<CR>
autocmd FileType nerdtree nnoremap <buffer> <C-p> <nop>
autocmd FileType nerdtree nnoremap <buffer> <Leader>p <nop>

" ===================
"  vim-fugitive
" =================== 
nmap     <Leader>g :Gstatus<CR>gg<c-n>
nnoremap <Leader>d :Gdiff<CR>

"============================================================
" Start pathogen
"============================================================
execute pathogen#infect()
colorscheme mine

"============================================================
" Start pathogen
"============================================================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

