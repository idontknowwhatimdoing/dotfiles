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
set laststatus=2
set wildmenu
set path+=**
set showcmd
set number
set noshowmode

" file browsing "
let g:netrw_banner=0
let g:netrw_liststyle=3

" mappings "
map Y y$
map 0 ^
nnoremap <C-L> :nohl<CR>
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap (<CR> (<CR>)<Esc>O
vnoremap Y "+y

" color theme "
if !exists("g:syntax_on")
	syntax enable
endif
set termguicolors
colorscheme yep

" status line "
hi User1 ctermfg=black ctermbg=red
hi User2 ctermfg=NONE ctermbg=black
hi User3 ctermfg=black ctermbg=blue
hi User4 ctermfg=black ctermbg=yellow
hi User5 ctermfg=black ctermbg=green
hi User6 ctermfg=black ctermbg=lightblue
hi User7 ctermfg=black ctermbg=darkmagenta cterm=bold
set statusline=%7*%{FullMode()}%6*%{branch}%3*\ %F%m%{readonly}%#StatusLine#%=%1*%{file_type}%4*\ %l:%c\ (%p%%)\  

" get the current git branch if it exists "
function! BranchName()
	let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	return strlen(l:branchname) > 0 ? '  '.l:branchname.' ' : ''
endfunction

" get the full name of the current mode and updates the color "
function! FullMode()
	let l:mode_map = {'n': '  NORMAL ', 'i': '  INSERT ', 'R': '  REPLACE ', 'v': '  VISUAL ', 'V': '  V-LINE ', "\<C-v>": '  V-BLOCK ','c': '  COMMAND ', 's': '  SELECT ', 'S': '  S-LINE ', "\<C-s>": '  S-BLOCK ', 't': '  TERMINAL '}
	if mode() == 'n'
		hi! User7 ctermfg=black ctermbg=darkmagenta cterm=bold
	elseif mode() == 'i'
		hi! User7 ctermfg=black ctermbg=darkgreen cterm=bold
	elseif mode() == 'v' || mode() == 'V' || mode() == '\<C-v>'
		hi! User7 ctermfg=black ctermbg=lightblue cterm=bold
	elseif mode() == 's' || mode() == 'S' || mode() == '\<C-s>'
		hi! User7 ctermfg=black ctermbg=darkyellow cterm=bold
	elseif mode() == 'R'
		hi! User7 ctermfg=black ctermbg=darkred cterm=bold
	endif
	return l:mode_map[mode()]
endfunction

" assign these variables only when we enter a new buffer "
augroup statusline_setup
	au!
	autocmd BufEnter * let branch = BranchName()
	autocmd BufEnter * let file_type = strlen(&ft) > 0 ? '  '.&ft.' ' : " text "
	autocmd BufEnter * let readonly = (&readonly || !&modifiable) ? ' [] ' : ' '
augroup end
