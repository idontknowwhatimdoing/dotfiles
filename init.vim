" general settings "
set hidden
set nostartofline
set noswapfile
"set lazyredraw (breaks the statusline at startup)
set nomodeline
set path+=**
set history=500

" indentation and wrapping "
set shiftwidth=4
set tabstop=4
set smartindent
set wrap
set linebreak
set breakindent

" better searching "
set smartcase
set ignorecase

" UI "
set number
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
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Right> :vertical resize +2<CR>n
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap (<CR> (<CR>)<Esc>O

" color theme "
syntax on
set termguicolors
colorscheme yep

" status line "
hi User1 guifg=black guibg=#FF6188
hi User3 guifg=black guibg=#FC9867
hi User4 guifg=black guibg=#FFD866
hi User6 guifg=black guibg=#FFAB22

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
		hi! User7 guifg=black guibg=#AB9DF2 gui=bold
	elseif l:cur == 'i'
		hi! User7 guifg=black guibg=#A9DC76 gui=bold
	elseif l:cur == 'v' || l:cur == 'V' || l:cur == "\<C-v>"
		hi! User7 guifg=black guibg=lightblue gui=bold
	elseif l:cur == 's' || l:cur == 'S' || l:cur == "\<C-s>"
		hi! User7 guifg=black guibg=darkyellow gui=bold
	elseif l:cur == 'R'
		hi! User7 guifg=black guibg=#FF6188 gui=bold
	else
		hi! User7 guifg=black guibg=#AB9DF2 gui=bold
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
	return "%#StatuslineNC#%{BranchName()}\ %F%{&modified?'[+]':''}%{Readonly()}%=%{FileType()}\ c:%c\ %LL\  "
endfunction

augroup yepcock
	au!
	autocmd WinEnter,BufEnter * setlocal statusline=%!Test()
	autocmd WinLeave * setlocal statusline=%!Test2()
augroup end
