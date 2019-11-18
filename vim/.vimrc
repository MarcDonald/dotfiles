" Enable plugin loading
packloadall
silent! helptags ALL
" Enable syntax highlighting
syntax enable
" Spacing
set tabstop=2
set softtabstop=2
" Show the command as its typed
set showcmd
" Command line completion
set wildmenu
" Don’t update screen during macro and script execution
set lazyredraw
" Highlight matching braces
set showmatch
" Live Searching
set incsearch
" Highlight search
set hlsearch
" Show invisible characters
set lcs=tab:▸\ ,trail:·
set list
" Use file name as window title
set title
" Sets the scroll offset to 3 lines
set scrolloff=2

" KEYBINDS
" Clear search by pressing enter or F3
nnoremap <CR> :noh<CR><CR>
nnoremap <F3> :noh<CR>
" Toggle number display with F2
nnoremap <F2> :set invnumber<CR>
" Toggle NERDTree with F1
nnoremap <F1> :NERDTreeToggle<CR>
