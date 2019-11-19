" vim-plug loading
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/goyo.vim'
Plug 'vim-scripts/mru.vim'
Plug 'amix/open_file_under_cursor.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
" Default vim8 plugin loading
packloadall
silent! helptags ALL
" Enable indent guides on startup
let g:indent_guides_enable_on_vim_startup = 1
" Enable syntax highlighting
syntax enable
" Set colorscheme
colorscheme pablo
" Spacing
set tabstop=2
set softtabstop=2
" Show the command as its typed
set showcmd
" Command line completion
set wildmenu
" Don't update screen during macro and script execution
set lazyredraw
" Highlight matching braces
set showmatch
" Live Searching
set incsearch
" Highlight search
set hlsearch
" Show invisible characters
set lcs=tab:▸\ ,trail:·
" Use file name as window title
set title
" Sets the scroll offset to 3 lines
set scrolloff=2
" Set async update time to 100
set updatetime=100
" Show and hide NERDTree by pressing F1
nnoremap <F1> :NERDTreeToggle<CR>
" Show and hide numbers by pressing F2
nnoremap <F2> :set invnumber<CR>
" Clear search by pressing enter or F3
nnoremap <CR> :noh<CR><CR>
nnoremap <F3> :noh<CR>
" Show and hide invisible characters by pressing F4
nnoremap <F4> :set invlist<CR>
" Toggle Goyo with F5
nnoremap <F5> :Goyo<CR>
" Open fzf Files with ;
nnoremap ; :Files<CR>
