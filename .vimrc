" PLUGINS ---------------------------------------------------------------- {{{
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
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-rooter'
Plug 'machakann/vim-highlightedyank'
Plug 'moll/vim-node'
Plug 'sheerun/vim-polyglot'
Plug 'justinmk/vim-sneak'
Plug 'chrisbra/Colorizer'
Plug 'joshdick/onedark.vim'
Plug 'prettier/vim-prettier'
Plug 'bkad/CamelCaseMotion'
Plug 'easymotion/vim-easymotion'

call plug#end()
" }}}

" ALE ---------------------------------------------------------------- {{{
let g:ale_fixers = {
      \'javascript':['prettier'],
      \'javascriptreact':['prettier'],
      \'typescript':['prettier'],
      \'typescriptreact':['prettier'],
      \'css':['prettier'],
      \'go':['gofmt'],
      \'markdown':['prettier'],
      \'json':['jq'],
      \'python':['black','isort'],
    \}
let g:ale_linters = {
      \'python':['pylint'],
    \}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{
" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Remap GitGutter keys to avoid conflicts
silent! unmap <leader>hp
silent! unmap <leader>hu
silent! unmap <leader>hs
nnoremap <leader>gp <Plug>(GitGutterPreviewHunk) 
nnoremap <leader>gu <Plug>(GitGutterUndoHunk) 
nnoremap <leader>gs <Plug>(GitGutterStageHunk) 
xmap <leader>gs <Plug>(GitGutterPreviewHunk) 

" Enable colorizer
au VimEnter,BufRead,BufNewFile * ColorHighlight

" Default vim8 plugin loading
packloadall
silent! helptags ALL

" Set encoding
set encoding=utf-8
set fileencoding=utf-8

syntax on

" Set colorscheme
set notermguicolors
colorscheme pablo

" Airline settings
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'

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
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Don't update screen during macro and script execution
set lazyredraw

" Highlight matching braces
set showmatch

set ignorecase
set incsearch
set hlsearch
set title
set scrolloff=2

" Show invisible characters
set lcs=tab:▸\ ,trail:·

" Set async update time to 100
set updatetime=100

" Show relative line numbers by default and show the current absolute line number
set rnu
set nu

" Make backspace behavior nicer
set backspace=eol,start,indent

" When opening a markdown or txt, set the textwidth to 80 and enable spell check
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.txt setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal spell

" Turn error bell off
set belloff=all
" Softwrap whole words instead of cutting words in half
set linebreak

" Neovim specific settings
if has('nvim')
  " Exit terminal with escape
  tnoremap <Esc> <C-\><C-n>
  " Use clipboard for all operations
  set clipboard+=unnamedplus
endif

" Ability to switch buffers without saving first
set hidden

" Auto update files in the background when changed outside vim
set autoread

" Persist undo tree
set undodir=~/.vim/undodir
set undofile
set undoreload=10000

filetype on
filetype plugin on
filetype indent on
" }}}

" MAPPINGS --------------------------------------------------------------- {{{
" Set leader
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"
" Show and hide NERDTree by pressing F1
nnoremap <F1> :NERDTreeToggle<CR>
" Clear search by pressing enter or F4
nnoremap <CR> :noh<CR><CR>
nnoremap <F4> :noh<CR>
" Toggle Goyo with F5
nnoremap <F5> :Goyo<CR>
" Toggle search case sensitivity with F6
nnoremap <F6> :set ignorecase! ignorecase?<CR>
" Show and hide invisible characters by pressing F7
nnoremap <F7> :set invlist<CR>
" Open file under cursor in new tab
map <leader>o <esc><C-W>gF<CR>:tabm<CR>
map <leader>gf :GFiles<CR>
map <leader>af :Files<CR>
map <leader>; :Buffers<CR>
map <leader>w :w<CR>
map <leader>aw :wa<CR>
map <leader><leader> <C-^>
map <leader>js :%!jq .<CR>
map <leader>q :bd<CR>
map <leader>l :bn<CR>
map <leader>h :bp<CR>
map <leader>aj :ALEPrevious<CR>
map <leader>ak :ALENext<CR>
map <leader>pf :ALEFix<CR>
map <leader>sc :set cuc!<CR>
xnoremap ytc "+y
nnoremap <leader>p "0p
nnoremap <leader>P "0P
nmap gm :LivedownToggle<CR>
nnoremap Y y$
nnoremap <leader>fp :Prettier<CR>

map <silent> <S-w> <Plug>CamelCaseMotion_w
map <silent> <S-b> <Plug>CamelCaseMotion_b
map <silent> <S-e> <Plug>CamelCaseMotion_e
map <silent> <leader><S-b> <Plug>CamelCaseMotion_ge

map <Leader> <Plug>(easymotion-prefix)
" }}}

