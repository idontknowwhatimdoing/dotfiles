" fzf config "
nnoremap <C-f> :Files<CR>
nnoremap s :BLines<CR>
nnoremap <S-s> :Rg<CR>

let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 1.0, 'border': 'sharp' } }

" avoid matching on file names
command! -bang -nargs=* Rg
  \ call fzf#vim#grep("rg --no-heading --colors 'path:fg:0x67,0xD4,0xFC' --color=always --line-number --hidden --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 3.. --preview-window=hidden'})

" markdown config "
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 3
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_follow_anchor = 1

autocmd FileType markdown setlocal spell spelllang=en_us
autocmd FileType markdown set conceallevel=3
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" markdown preview "
function MarkdownPreview() abort
	call jobstart('grip -b ' . shellescape(expand('%:p')))
endfunction

command MDP call MarkdownPreview()
