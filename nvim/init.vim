" general settings "
set nocompatible
filetype plugin indent on
set backspace=indent,eol,start
set autoread
set hidden
set nostartofline
set encoding=utf-8
set noswapfile
set lazyredraw
set ttyfast
set nomodeline
set path=.,,**

" indentation and wrapping "
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set wrap
set linebreak
set breakindent

" better searching "
set hlsearch
set incsearch
set smartcase
set ignorecase

" UI "
set number
set laststatus=2
set wildmenu
set showcmd
set noshowmode

" mappings "
map Y y$
map 0 ^
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-Up> :res +2<CR>
nnoremap <C-Down> :res -2<CR>
nnoremap <C-Left> :vertical res -2<CR>
nnoremap <C-Right> :vertical res +2<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <C-q> :noh<CR>
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap <C-f> <C-x><C-f>

autocmd FileType markdown set conceallevel=2

" color theme "
syntax on
set termguicolors
colorscheme $THEME

source $XDG_CONFIG_HOME/nvim/statusline.vim
source $XDG_CONFIG_HOME/nvim/tabline.vim
source $XDG_CONFIG_HOME/nvim/plugins.vim
