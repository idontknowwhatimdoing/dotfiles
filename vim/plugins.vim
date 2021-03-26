nnoremap <C-f> :Files<CR>

let g:fzf_colors =
	\ {'fg':     ['fg', 'PreProc'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'Comment'],
	\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Keyword'],
	\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':     ['fg', 'Statement'],
	\ 'info':    ['fg', 'Constant'],
	\ 'border':  ['fg', 'Conditional'],
	\ 'prompt':  ['fg', 'Operator'],
	\ 'query':	 ['fg', 'Operator'],
	\ 'pointer': ['fg', 'Keyword'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment'] }

let g:fzf_preview_window = 'right:60%:sharp'
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6, 'border': 'sharp' } }
