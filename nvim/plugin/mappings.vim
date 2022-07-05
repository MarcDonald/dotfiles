nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" Show and hide NERDTree by pressing F1
nnoremap <C-t> :NERDTreeToggle<CR>

" Toggle search case sensitivity with F6
nnoremap <F6> :set ignorecase! ignorecase?<CR>
" Show and hide invisible characters by pressing F7
nnoremap <F7> :set invlist<CR>
" Open file under cursor in new tab
nnoremap <leader>o <esc><C-W>gF<CR>:tabm<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>aw :wa<CR>
nnoremap <leader><leader> <C-^>
nnoremap <leader>js :%!jq .<CR>
nnoremap <leader>q :bd<CR>
nnoremap <leader>l :bn<CR>
nnoremap <leader>h :bp<CR>
nnoremap <leader>aj :ALEPrevious<CR>
nnoremap <leader>ak :ALENext<CR>
nnoremap <leader>pf :ALEFix<CR>
nnoremap <leader>sc :set cuc!<CR>
nnoremap <leader>pp "0p
nnoremap <leader>PP "0P
nnoremap <leader>fp :Prettier<CR>

xnoremap <leader>yc "+y
nnoremap Y y$

nnoremap <silent>w <Plug>CamelCaseMotion_w
nnoremap <silent>b <Plug>CamelCaseMotion_b
nnoremap <silent>e <Plug>CamelCaseMotion_e
nnoremap <silent>ge <Plug>CamelCaseMotion_ge
" sunmap w
" sunmap b
" sunmap e
" sunmap ge

nnoremap <Leader> <Plug>(easymotion-prefix)
vnoremap <leader>s <Plug>VSurround
unmap S

nunmap ys
nunmap yS
nunmap yss
nunmap ySs
nunmap ySS
nunmap y<C-G>
