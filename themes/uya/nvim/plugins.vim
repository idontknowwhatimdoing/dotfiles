" fzf config "
nnoremap <C-f> :Files<CR>
nnoremap s :BLines<CR>
nnoremap <S-s> :Rg<CR>

let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 1.0, 'border': 'sharp' } }

" avoid matching on file names
command! -bang -nargs=* Rg
  \ call fzf#vim#grep("rg --no-heading --colors 'path:fg:0x67,0xD4,0xFC' --color=always --line-number --hidden --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 3.. --preview-window=hidden'})

autocmd FileType markdown set conceallevel=3

" markdown preview "
function MarkdownPreview() abort
	call jobstart('grip -b ' . shellescape(expand('%:p')))
endfunction
command MDP call MarkdownPreview()
