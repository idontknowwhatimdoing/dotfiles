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
colorscheme mountain

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

" Custom statusline made for the minimal aesthetic of Mountain!
" Please note that this relies heavily on source code from the ever-generous
" r/unixporn mod JavaCafe :)

function! RedrawModeColors(mode)
	if a:mode == 'n'
		hi MyStatuslineAccent guifg=#0f0f0f gui=none guibg=#050505
		hi MyStatuslineAccentBody guifg=#0f0f0f gui=none guibg=#ac8a8c
	elseif a:mode == 'i'
		hi MyStatuslineAccent guibg=#0f0f0f gui=none guifg=#0f0f0f
		hi MyStatuslineAccentBody guifg=#050505 gui=none guibg=#8aac8b
	elseif a:mode == 'R'
		hi MyStatuslineAccent guibg=#0f0f0f gui=none guifg=#0f0f0f
		hi MyStatuslineAccentBody guifg=#050505 gui=none guibg=#8aabac
	elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
		hi MyStatuslineAccent guibg=#0f0f0f gui=none guifg=#0f0f0f
		hi MyStatuslineAccentBody guifg=#050505 gui=none guibg=#aca98a
	endif
	return ''
endfunction

function! SetFiletype(filetype)
	return a:filetype == '' ? 'text' : a:filetype
endfunction

set statusline=%{RedrawModeColors(mode())}
set statusline+=%#MyStatuslineAccent#
set statusline+=%#MyStatuslineAccentBody#\ \ \ 
set statusline+=%#MyStatuslineSeparator#
set statusline+=%#MyStatuslineFilename#\ %f
set statusline+=%#MyStatuslineFilename#\ %{&modified?'[+]':''}
set statusline+=%#MyStatuslineSeparator#\ %#reset#
set statusline+=%=
set statusline+=%#MyStatuslineLineCol#
set statusline+=\ %#MyStatuslineLineColBody#%c
set statusline+=%#MyStatuslineLineCol#
set statusline+=\ 
set statusline+=%#MyStatuslinePercentage#\|
set statusline+=\ %#MyStatuslinePercentageBody#%L
set statusline+=%#MyStatuslinePercentage#
set statusline+=\ 
set statusline+=%#MyStatuslineFiletype#
set statusline+=%#MyStatuslineFiletypeBody#\ %{SetFiletype(&filetype)}\ 
set statusline+=%#MyStatuslineFiletype#

hi MyStatuslineFilename guifg=#f0f0f0 gui=none guibg=#191919
hi StatusLine          guifg=none       guibg=#0f0f0f  gui=NONE
hi StatusLineNC        guifg=#050505    guibg=#c49ea0  gui=none
hi MyStatuslineSeparator guifg=#191919 gui=none guibg=#191919 
hi reset guibg=#0f0f0f
hi MyStatuslineFiletype guibg=#0f0f0f gui=none guifg=#191919
hi MyStatuslineFiletypeBody guibg=#ac8aac gui=none guifg=#050505
hi MyStatuslinePercentage guibg=#191919 gui=none guifg=#f0f0f0
hi MyStatuslinePercentageBody guibg=#191919 gui=none guifg=#f0f0f0
hi MyStatuslineLineCol guibg=#191919 gui=none guifg=#f0f0f0
hi MyStatuslineLineColBody guibg=#191919 gui=none guifg=#f0f0f0
