set background=dark
colorscheme default
set number
set relativenumber
set nocompatible
filetype on
filetype plugin on
filetype indent on
set scrolloff=10
set ignorecase
set incsearch
set smartcase
set showcmd
set showmode
syntax on
set path+=**
set wildmenu
set wildoptions=pum,fuzzy
set wildmode=list:full
set clipboard+=unnamedplus
set expandtab
set tabstop=4
set shiftwidth=4

set list
set listchars=tab:\ \ ┊
set listchars=multispace:\ \ ┊

let g:netrw_winsize=30
let g:netrw_liststyle=3
let g:netrw_banner=0

let g:mapleader=" "

" insert mode remaps
inoremap jk <esc>

" normal mode remaps
nnoremap x "_x
nnoremap <leader>e :Lexplore!<cr>
nnoremap <leader>ww :set wrap!<cr>
nnoremap <leader>ss :set spell!<cr>
nnoremap ]b :bn<cr>
nnoremap [b :bp<cr>
nnoremap <leader>x :bd!<cr>
nnoremap <C-x>0 :close<CR>
nnoremap <C-x>1 <C-w>o
nnoremap <C-x>2 <C-w>s
nnoremap <C-x>3 <C-w>v
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap ) )zz
nnoremap ( (zz
nnoremap } }zz
nnoremap { {zz
nnoremap <leader>b :buffers<cr>

" visual mode remaps
vnoremap jk <esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap < <gv
vnoremap > >gv
vnoremap x "_x
