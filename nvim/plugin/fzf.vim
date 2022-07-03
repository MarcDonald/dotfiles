nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap ;f :GFiles<CR>
nnoremap ;s :GFiles?<CR>
nnoremap ;a :Files<CR>
nnoremap ;c :Commits<CR>
nnoremap ;b :Buffers<CR>
nnoremap ;l :Lines<CR>
