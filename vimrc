" general settings "
set nocompatible
filetype plugin indent on
set backspace=indent,eol,start
set autoread
set hidden
set nostartofline
set encoding=utf-8
set noswapfile
"set lazyredraw (breaks the statusline at startup)
set ttyfast
set nomodeline
set path+=**

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

" file browsing "
let g:netrw_banner=0
let g:netrw_liststyle=3

" mappings "
map Y y$
map 0 ^
nnoremap <C-i> :noh<CR>
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap (<CR> (<CR>)<Esc>O

" color theme "
if !exists("g:syntax_on")
	syntax enable
endif
set termguicolors
colorscheme yep

" status line "
hi User1 ctermfg=black ctermbg=red
hi User3 ctermfg=black ctermbg=blue
hi User4 ctermfg=black ctermbg=yellow
hi User6 ctermfg=black ctermbg=03
hi User7 ctermfg=black ctermbg=darkmagenta cterm=bold
"setlocal statusline=%7*%{FullMode()}%6*%{branch}%3*\ %F%{&modified?'[+]':''}%{readonly}%#StatusLine#%=%1*%{file_type}%4*\ c:%c\ %LL\  
"setlocal statusline=%!Test()

" get the current git branch if it exists "
function! BranchName()
	let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	return strlen(l:branchname) > 0 ? '  '.l:branchname.' ' : ''
endfunction

" get the full name of the current mode and updates the color "
function! FullMode()
	let l:mode_map = {'n': '  NORMAL ', 'i': '  INSERT ', 'R': '  REPLACE ', 'v': '  VISUAL ', 'V': '  V-LINE ', "\<C-v>": '  V-BLOCK ','c': '  COMMAND ', 's': '  SELECT ', 'S': '  S-LINE ', "\<C-s>": '  S-BLOCK ', 't': '  TERMINAL '}
	let l:cur = mode()
	if l:cur == 'n'
		hi User7 ctermfg=black ctermbg=darkmagenta cterm=bold
	elseif l:cur == 'i'
		hi User7 ctermfg=black ctermbg=darkgreen cterm=bold
	elseif l:cur == 'v' || l:cur == 'V' || l:cur == "\<C-v>"
		hi User7 ctermfg=black ctermbg=lightblue cterm=bold
	elseif l:cur == 's' || l:cur == 'S' || l:cur == "\<C-s>"
		hi User7 ctermfg=black ctermbg=darkyellow cterm=bold
	elseif l:cur == 'R'
		hi User7 ctermfg=black ctermbg=darkred cterm=bold
	else
		hi User7 ctermfg=black ctermbg=05 cterm=bold
	endif
	return l:mode_map[l:cur]
endfunction

function! FileType()
	return strlen(&ft) > 0 ? '  '.&ft.' ' : '  text '
endfunction

function! Readonly()
	return (&readonly || !&modifiable) ? ' [] ' : ' '
endfunction

function! Test()
	return "%7*%{FullMode()}%6*%{BranchName()}%3*\ %F%{&modified?'[+]':''}%{Readonly()}%#StatusLine#%=%1*%{FileType()}%4*\ c:%c\ %LL\  "
endfunction

function! Test2()
	return "%6*%{BranchName()}%3*\ %F%{&modified?'[+]':''}%{Readonly()}%#StatusLine#%=%1*%{FileType()}%4*\ c:%c\ %LL\  "
endfunction

augroup yepcock
	au!
	autocmd WinEnter,BufEnter * setlocal statusline=%!Test()
	autocmd WinLeave * setlocal statusline=%!Test2()
augroup end
