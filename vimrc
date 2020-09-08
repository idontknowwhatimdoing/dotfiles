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
set cmdheight=1
set showcmd
set number
set noshowmode

" file browsing "
let g:netrw_banner=0
let g:netrw_liststyle=3

" mappings "
map Y y$
map <C-c> <Esc><Esc>
map 0 ^
noremap <C-L> :nohl<CR>
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap (<CR> (<CR>)<Esc>O
vnoremap Y "+y

" color theme "
if !exists("g:syntax_on")
	syntax enable
endif
set termguicolors
set background=dark
colorscheme yep

" status line "
hi StatusLineNC ctermfg=black ctermbg=yellow cterm=NONE
hi User1 ctermfg=black ctermbg=magenta
hi User2 ctermfg=NONE ctermbg=black
hi User3 ctermfg=black ctermbg=blue
hi User4 ctermfg=black ctermbg=cyan
set statusline=\ %{GetFullMode()}\ %#StatusLineNC#%{branch}%3*\ %F%m\ %2*%=%1*\ %{file_type}\ %4*\ %l:%c\ (%p%%)\  

" display git branch if it exists "
augroup git_branch_name
	au!
	autocmd BufEnter * let branch = BranchName()
augroup end

function! BranchName()
	let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	return strlen(l:branchname) > 0 ? '  '.l:branchname.' ' : ''
endfunction

" display file type if there is one "
augroup display_filetype
	au!
	autocmd BufEnter * let file_type = CheckFileType()
augroup end

function! CheckFileType()
	return strlen(&ft) > 0 ? &ft : "text"
endfunction

" display current mode "
function! GetFullMode()
	let mode_map = {'n': 'NORMAL', 'i': 'INSERT', 'R': 'REPLACE', 'v': 'VISUAL', 'V': 'V-LINE', "\<C-v>": 'V-BLOCK','c': 'COMMAND', 's': 'SELECT', 'S': 'S-LINE', "\<C-s>": 'S-BLOCK', 't': 'TERMINAL'}
	return mode_map[mode()]
endfunction
