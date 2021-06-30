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
