nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" Show and hide NERDTree by pressing F1
nnoremap <C-t> :NERDTreeToggle<CR>

" Toggle search case sensitivity with F6
nnoremap <F6> :set ignorecase! ignorecase?<CR>
" Show and hide invisible characters by pressing F7
nnoremap <F7> :set invlist<CR>
" Open file under cursor in new tab
nmap <leader>o <esc><C-W>gF<CR>:tabm<CR>
nmap <leader>w :w<CR>
nmap <leader>aw :wa<CR>
nmap <leader><leader> <C-^>
nmap <leader>js :%!jq .<CR>
nmap <leader>q :bd<CR>
nmap <leader>l :bn<CR>
nmap <leader>h :bp<CR>
nmap <leader>aj :ALEPrevious<CR>
nmap <leader>ak :ALENext<CR>
nmap <leader>pf :ALEFix<CR>
nmap <leader>sc :set cuc!<CR>
nmap <leader>pp "0p
nmap <leader>PP "0P
nmap <leader>pf :Prettier<CR>

xmap <leader>yc "+y
nmap Y y$

nnoremap <silent>w <Plug>CamelCaseMotion_w
nnoremap <silent>b <Plug>CamelCaseMotion_b
nnoremap <silent>e <Plug>CamelCaseMotion_e
nnoremap <silent>ge <Plug>CamelCaseMotion_ge
" sunmap w
" sunmap b
" sunmap e
" sunmap ge

nmap <Leader> <Plug>(easymotion-prefix)
nmap <leader>f <Plug>(easymotion-s)
nmap <leader>F <Plug>(easymotion-f)
vnoremap <leader>s <Plug>VSurround
unmap S

nunmap ys
nunmap yS
nunmap yss
nunmap ySs
nunmap ySS
nunmap y<C-G>
