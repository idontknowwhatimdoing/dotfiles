nnoremap <C-f> :Files<CR>
nnoremap s :BLines<CR>
nnoremap <S-s> :Rg<CR>

let g:fzf_preview_window = 'right:60%:sharp'
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 1.0, 'border': 'sharp' } }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
