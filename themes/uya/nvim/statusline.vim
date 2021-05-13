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
	return strlen(&ft) ? ' '.&ft.' ' : ' text '
endfunction

function! Readonly()
	return (&readonly || !&modifiable) ? '[] ' : ' '
endfunction

function Modified()
	return &modified ? '[+]' : ''
endfunction

function! StatusLine(is_active)
	return a:is_active ? "%7*%{FullMode(mode())}%1*%{BranchName()}%3*\ %F%{Modified()}%{Readonly()}%#StatusLine#%=%4*\ %c\ |\ %L\ %1*%{FileType()}" : "%#StatusLine#%{BranchName()}\ %F%{Modified()}%{Readonly()}%=\ %c\ |\ %L\ %{FileType()}"
endfunction

augroup statusline_setup
	au!
	autocmd WinEnter,BufEnter * setlocal statusline=%!StatusLine(1)
	autocmd WinLeave * setlocal statusline=%!StatusLine(0)
augroup end
