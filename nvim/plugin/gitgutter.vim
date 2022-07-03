" Remap GitGutter keys to avoid conflicts
silent! unmap <leader>hp
silent! unmap <leader>hu
silent! unmap <leader>hs
nnoremap <leader>gp <Plug>(GitGutterPreviewHunk) 
nnoremap <leader>gu <Plug>(GitGutterUndoHunk) 
nnoremap <leader>gs <Plug>(GitGutterStageHunk) 
xmap <leader>gs <Plug>(GitGutterPreviewHunk) 
