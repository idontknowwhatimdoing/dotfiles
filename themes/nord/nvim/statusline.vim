" status line colors "
hi User1 guifg=#2E3440 guibg=#81A1C1
hi User2 guifg=#2E3440 guibg=#B48EAD
hi User3 guifg=#2E3440 guibg=#81A1C1
hi User4 guifg=#2E3440 guibg=#88C0D0
hi User7 guifg=#2E3440 guibg=#88C0D0 gui=bold

" helper functions for the statusline "
function! BranchName()
	let l:branchname = system("git rev-parse --abbrev-ref HEAD 2> /dev/null | tr -d '\n'")
	return strlen(l:branchname) > 0 ? '  '.l:branchname.' ' : ''
endfunction

let g:mode_map = {'n': '  NORMAL ', 'i': '  INSERT ', 'R': '  REPLACE ', 'v': '  VISUAL ', 'V': '  V-LINE ', "\<C-v>": '  V-BLOCK ','c': '  COMMAND ',  't': '  TERMINAL '}
function! FullMode(cur)
	return g:mode_map[a:cur]
endfunction

function! FileType()
	return strlen(&ft) ? ' '.&ft.' ' : ' text '
endfunction

function! Readonly()
	return (&readonly || !&modifiable) ? '[] ' : ' '
endfunction

function Modified()
	return &modified ? '[+]' : ''
endfunction

function! StatusLine(is_active)
	return a:is_active ? "%7*%{FullMode(mode())}%2*%{BranchName()}%3*\ %F%{Modified()}%{Readonly()}%#StatusLine#%=%4*\ %c\ |\ %L\ %1*%{FileType()}" : "%#StatusLine#%{BranchName()}\ %F%{Modified()}%{Readonly()}%=\ %c\ |\ %L\ %{FileType()}"
endfunction

augroup statusline_setup
	au!
	autocmd WinEnter,BufEnter * setlocal statusline=%!StatusLine(1)
	autocmd WinLeave * setlocal statusline=%!StatusLine(0)
augroup end
