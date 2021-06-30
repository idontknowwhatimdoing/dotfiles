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

" color theme "
if !exists("g:syntax_on")
	syntax enable
endif
set termguicolors
colorscheme uya

function! TabLine()
	let s = ''
	for i in range(tabpagenr('$'))
		let tabnr = i + 1
		let buflist = tabpagebuflist(tabnr)
		let winnr = tabpagewinnr(tabnr)
		let bufnr = buflist[winnr - 1]
		let bufname = fnamemodify(bufname(bufnr), ':t')

		let s .= (tabnr == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
		let s .= empty(bufname) ? ' [No Name] ' : ' ' . bufname . ' '
		let bufmodified = getbufvar(bufnr, "&mod")
		if bufmodified | let s .= '+ ' | endif
	endfor
	let s .= '%#TabLineFill#'
	return s
endfunction

set tabline=%!TabLine()

" custom statusline "
source ~/.dotfiles/themes/uya/nvim/statusline.vim

" plugins config "
source ~/.config/nvim/plugins.vim
