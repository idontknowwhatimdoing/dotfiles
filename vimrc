set nocompatible
filetype off
syntax on
filetype plugin indent on
set modelines=0
set wrap
set linebreak
set breakindent
set number
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set ttyfast
set laststatus=2
set encoding=utf-8
set noerrorbells
set noswapfile
set wildmenu
set shiftwidth=4
set tabstop=4
set showcmd
set nostartofline
set autoindent
set cmdheight=1
so ~/.vim/plugins.vim
set termguicolors
let ayucolor="mirage"
colorscheme ayu
let g:lightline = {
  \		'colorscheme': "wombat",
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }
imap <C-c> <Esc><Esc>
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
nnoremap T :NERDTreeToggle<CR>
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>
inoremap {} {}
inoremap [] []
inoremap () ()
inoremap "" ""
inoremap '' ''
inoremap `` ``

let g:racer_cmd = "/home/jeremy/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
set hidden

let g:rustfmt_autosave = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nmap <F8> :TagbarToggle<CR>
