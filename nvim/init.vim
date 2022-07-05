set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

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
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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
Plug 'psliwka/vim-smoothie'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/argtextobj.vim'

" LSP ---------------------------------------------------------------- {{{
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" }}}

call plug#end()

" Default vim8 plugin loading
packloadall
silent! helptags ALL

" Enable colorizer
au VimEnter,BufRead,BufNewFile * ColorHighlight
" }}}

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

set encoding=utf-8
set fileencoding=utf-8
filetype on
filetype plugin on
filetype indent on
syntax on

" Set colorscheme
set notermguicolors
colorscheme pablo

" Spacing
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
" Uncomment below to use spaces instead of tabs
" set expandtab

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set showcmd
set lazyredraw
set showmatch
set ignorecase
set incsearch
set nohlsearch
set title
set exrc
set relativenumber
set nu
set scrolloff=6
set linebreak
set noerrorbells
set belloff=all
set hidden
set autoread
set nowrap
set noswapfile
set nobackup
set signcolumn=yes
set colorcolumn=120
set completeopt=menuone,noselect,noinsert
set lcs=tab:▸\ ,trail:·
set updatetime=50
set backspace=eol,start,indent

" When opening a markdown or txt enable spell check
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.txt setlocal spell
au BufWrite *.ts,*.tsx,*.js,*.jsx :Prettier

" Neovim specific settings
if has('nvim')
  " Exit terminal with escape
  tnoremap <Esc> <C-\><C-n>
  " Use clipboard for all operations
  set clipboard+=unnamedplus
endif

" Persist undo tree
set undodir=~/.vim/undodir
set undofile
set undoreload=10000

let g:argtextobj_pairs="[:],(:),<:>"
