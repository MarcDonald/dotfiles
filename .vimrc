" vim-plug loading
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
Plug 'shime/vim-livedown'
Plug 'udalov/kotlin-vim'
Plug 'tpope/vim-unimpaired'

call plug#end()
" Default vim8 plugin loading
packloadall
silent! helptags ALL
" Enable syntax highlighting
syntax enable
" Set colorscheme
colorscheme pablo
" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'
" Spacing
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
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
" Show relative line numbers by default
set rnu
" Show absolute line number of current line
set nu
" Make backspace behavior nicer
set backspace=eol,start,indent
" Show and hide NERDTree by pressing F1
nnoremap <F1> :NERDTreeToggle<CR>
" Open file under cursor in new tab
map <F2> <Esc><C-W>gF<CR>:tabm<CR>
" Clear search by pressing enter or F4
nnoremap <CR> :noh<CR><CR>
nnoremap <F4> :noh<CR>
" Toggle Goyo with F5
nnoremap <F5> :Goyo<CR>
" Toggle search case sensitivity with F6
nnoremap <F6> :set ignorecase! ignorecase?<CR>
" Show and hide invisible characters by pressing F7
nnoremap <F7> :set invlist<CR>
" Open fzf Files with =
nnoremap = :Files<CR>
