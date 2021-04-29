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

" file browsing "
let g:netrw_banner=0
let g:netrw_liststyle=3

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

" status line colors "
hi User1 ctermfg=black ctermbg=red guifg=#0F1419 guibg=#FC6A67
hi User3 ctermfg=black ctermbg=blue guifg=#0F1419 guibg=#FC8F67
hi User4 ctermfg=black ctermbg=yellow guifg=#0F1419 guibg=#FFD866
hi User7 ctermfg=black ctermbg=yellow cterm=bold guifg=#0F1419 guibg=#FFD866 gui=bold

" helper functions for the statusline "
function! BranchName()
	let l:branchname = system("git rev-parse --abbrev-ref HEAD 2> /dev/null | tr -d '\n'")
	return strlen(l:branchname) > 0 ? '  '.l:branchname.' ' : ''
endfunction

let g:mode_map = {'n': '  NORMAL ', 'i': '  INSERT ', 'R': '  REPLACE ', 'v': '  VISUAL ', 'V': '  V-LINE ', "\<C-v>": '  V-BLOCK ','c': '  COMMAND ', 's': '  SELECT ', 'S': '  S-LINE ', "\<C-s>": '  S-BLOCK ', 't': '  TERMINAL '}
function! FullMode(cur)
	return g:mode_map[a:cur]
endfunction

function! FileType()
	return strlen(&ft) ? '  '.&ft.' ' : '  text '
endfunction

function! Readonly()
	return (&readonly || !&modifiable) ? '[] ' : ' '
endfunction

function Modified()
	return &modified ? '[+]' : ''
endfunction

function! StatusLine(is_active)
	return a:is_active ? "%7*%{FullMode(mode())}%1*%{BranchName()}%3*\ %F%{Modified()}%{Readonly()}%#StatusLine#%=%1*%{FileType()}%4*\ c:%c\ %LL\ " : "%#StatusLine#%{BranchName()}\ %F%{Modified()}%{Readonly()}%=%{FileType()}\ c:%c\ %LL\ "
endfunction

augroup statusline_setup
	au!
	autocmd WinEnter,BufEnter * setlocal statusline=%!StatusLine(1)
	autocmd WinLeave * setlocal statusline=%!StatusLine(0)
augroup end

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



" 42 header
let s:asciiart = [
			\"        :::      ::::::::",
			\"      :+:      :+:    :+:",
			\"    +:+ +:+         +:+  ",
			\"  +#+  +:+       +#+     ",
			\"+#+#+#+#+#+   +#+        ",
			\"     #+#    #+#          ",
			\"    ###   ########.fr    "
			\]

let s:start		= '/*'
let s:end		= '*/'
let s:fill		= '*'
let s:length	= 80
let s:margin	= 5

let s:types		= {
			\'\.c$\|\.h$\|\.cc$\|\.hh$\|\.cpp$\|\.hpp$\|\.php':
			\['/*', '*/', '*'],
			\'\.htm$\|\.html$\|\.xml$':
			\['<!--', '-->', '*'],
			\'\.js$':
			\['//', '//', '*'],
			\'\.tex$':
			\['%', '%', '*'],
			\'\.ml$\|\.mli$\|\.mll$\|\.mly$':
			\['(*', '*)', '*'],
			\'\.vim$\|\vimrc$':
			\['"', '"', '*'],
			\'\.el$\|\emacs$':
			\[';', ';', '*'],
			\'\.f90$\|\.f95$\|\.f03$\|\.f$\|\.for$':
			\['!', '!', '/']
			\}

function! s:filetype()
	let l:f = s:filename()

	let s:start	= '#'
	let s:end	= '#'
	let s:fill	= '*'

	for type in keys(s:types)
		if l:f =~ type
			let s:start	= s:types[type][0]
			let s:end	= s:types[type][1]
			let s:fill	= s:types[type][2]
		endif
	endfor

endfunction

function! s:ascii(n)
	return s:asciiart[a:n - 3]
endfunction

function! s:textline(left, right)
	let l:left = strpart(a:left, 0, s:length - s:margin * 3 - strlen(a:right) + 1)

	return s:start . repeat(' ', s:margin - strlen(s:start)) . l:left . repeat(' ', s:length - s:margin * 2 - strlen(l:left) - strlen(a:right)) . a:right . repeat(' ', s:margin - strlen(s:end)) . s:end
endfunction

function! s:line(n)
	if a:n == 1 || a:n == 11 " top and bottom line
		return s:start . ' ' . repeat(s:fill, s:length - strlen(s:start) - strlen(s:end) - 2) . ' ' . s:end
	elseif a:n == 2 || a:n == 10 " blank line
		return s:textline('', '')
	elseif a:n == 3 || a:n == 5 || a:n == 7 " empty with ascii
		return s:textline('', s:ascii(a:n))
	elseif a:n == 4 " filename
		return s:textline(s:filename(), s:ascii(a:n))
	elseif a:n == 6 " author
		return s:textline("By: " . s:user() . " <" . s:mail() . ">", s:ascii(a:n))
	elseif a:n == 8 " created
		return s:textline("Created: " . s:date() . " by " . s:user(), s:ascii(a:n))
	elseif a:n == 9 " updated
		return s:textline("Updated: " . s:date() . " by " . s:user(), s:ascii(a:n))
	endif
endfunction

function! s:user()
	return "jkromer"
endfunction

function! s:mail()
	return "jkromer@42.fr"
endfunction

function! s:filename()
	let l:filename = expand("%:t")
	if strlen(l:filename) == 0
		let l:filename = "< new >"
	endif
	return l:filename
endfunction

function! s:date()
	return strftime("%Y/%m/%d %H:%M:%S")
endfunction

function! s:insert()
	let l:line = 11

	" empty line after header
	call append(0, "")

	" loop over lines
	while l:line > 0
		call append(0, s:line(l:line))
		let l:line = l:line - 1
	endwhile
endfunction

function! s:update()
	call s:filetype()
	if getline(9) =~ s:start . repeat(' ', s:margin - strlen(s:start)) . "Updated: "
		if &mod
			call setline(9, s:line(9))
		endif
		call setline(4, s:line(4))
		return 0
	endif
	return 1
endfunction

function! s:stdheader()
	if s:update()
		call s:insert()
	endif
endfunction

" Bind command and shortcut
command! Stdheader call s:stdheader ()
map <F1> :Stdheader<CR>
autocmd BufWritePre * call s:update ()

" plugins config "
source ~/.config/nvim/plugins.vim
