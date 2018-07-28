set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'editorconfig/editorconfig-vim'
"Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'mustache/vim-mustache-handlebars'
"Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'VaiN474/vim-etlua'
"Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'posva/vim-vue'
"Plug 'jremmen/vim-ripgrep'
Plug 'mileszs/ack.vim'
Plug 'spacewander/openresty-vim'
Plug 'hashivim/vim-terraform'
"Plug 'bronson/vim-trailing-whitespace'

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

let g:lightline = {
  \ 'colorscheme': 'powerline_customized',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
  \ },
\ }

let g:ackprg = 'rg --vimgrep'
"cnoreabbrev Rg Ack!
"cabbr Rg Ack
command -nargs=* Rg Ack! <args>

" Store swapfiles in  central location (trailing // ensures the filenames are
" globally unique).
set directory^=~/.vim/swapfiles//

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

au BufNewFile,BufRead Jenkinsfile* setf groovy
"au BufNewFile,BufRead *.etlua setf html

autocmd FileType vue syntax sync fromstart
