set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'mustache/vim-mustache-handlebars'

call plug#end()

set number
syntax on

set autoindent
set nosmartindent
set cindent

set cinkeys-=0#
set indentkeys-=0#

set ruler
set laststatus=2

filetype plugin indent on

set incsearch
set hlsearch

set spell
set spelllang=en_us

set expandtab
set shiftwidth=2
set tabstop=2

let g:netrw_list_hide= '.*\.swp$'

au BufRead,BufNewFile *.py set tabstop=4 shiftwidth=4

let g:netrw_liststyle=1
let g:netrw_banner=0

" Store swapfiles in  central location (trailing // ensures the filenames are
" globally unique).
set directory^=~/.vim/swapfiles//
