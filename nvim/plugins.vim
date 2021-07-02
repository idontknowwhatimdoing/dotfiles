" fzf config "
nnoremap <C-f>	:Files<CR>
nnoremap s		:BLines<CR>
nnoremap <S-s>	:Rg<CR>

"let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 1.0, 'border': 'none' } }

" avoid matching on file names
command -nargs=* Rg
  \ call fzf#vim#grep("rg --no-heading --colors 'path:fg:0x8a,0xab,0xac' --color=always --line-number --hidden --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 3.. --preview-window=hidden'})

" markdown preview "
function MarkdownPreview() abort
	call jobstart('grip -b ' . shellescape(expand('%:p')))
endfunction
command MDP call MarkdownPreview()
