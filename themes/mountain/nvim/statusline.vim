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
		hi MyStatuslineAccentBody guifg=#050505 gui=none guibg=#8f8aac
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
set statusline+=%#MyStatuslineFilename#\ %{&modified?'[+]\ ':''}
set statusline+=%#MyStatuslineSeparator#\%#reset#
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
hi MyStatuslineFiletypeBody guibg=#aca98a gui=none guifg=#050505
hi MyStatuslinePercentage guibg=#191919 gui=none guifg=#f0f0f0
hi MyStatuslinePercentageBody guibg=#191919 gui=none guifg=#f0f0f0
hi MyStatuslineLineCol guibg=#191919 gui=none guifg=#f0f0f0
hi MyStatuslineLineColBody guibg=#191919 gui=none guifg=#f0f0f0
