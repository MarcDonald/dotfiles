" vim-plug loading
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
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
Plug 'udalov/kotlin-vim'
Plug 'tpope/vim-unimpaired'
Plug 'rust-lang/rust.vim'
Plug 'airblade/vim-rooter'
Plug 'machakann/vim-highlightedyank'
Plug 'moll/vim-node'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'justinmk/vim-sneak'
Plug 'chrisbra/Colorizer'
Plug 'joshdick/onedark.vim'

call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Set leader
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" ALE
let g:ale_fixers = {
      \'javascript':['prettier'],
      \'javascriptreact':['prettier'],
      \'typescript':['prettier'],
      \'typescriptreact':['prettier'],
      \'css':['prettier'],
      \'rust':['rustfmt'],
      \'markdown':['prettier'],
      \'json':['jq'],
      \'python':['black','isort'],
    \}
let g:ale_linters = {
      \'python':['pylint'],
    \}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
" /ALE

" COC
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use <TAB> for selections ranges.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
" 'Smart' navigation
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent><expr> <S-TAB>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>check_back_space() ? "\<C-d>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Show signature help on placeholder jump
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" /COC

" Remap GitGutter keys to avoid conflicts
silent! unmap <leader>hp
silent! unmap <leader>hu
silent! unmap <leader>hs
nnoremap <leader>gp <Plug>(GitGutterPreviewHunk) 
nnoremap <leader>gu <Plug>(GitGutterUndoHunk) 
nnoremap <leader>gs <Plug>(GitGutterStageHunk) 
xmap <leader>gs <Plug>(GitGutterPreviewHunk) 
" /GitGutter

" Enable colorizer
au VimEnter,BufRead,BufNewFile * ColorHighlight

" Default vim8 plugin loading
packloadall
silent! helptags ALL
" Set encoding
set encoding=utf-8
set fileencoding=utf-8
" Enable syntax highlighting
syntax on
" Set colorscheme
colorscheme onedark
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
" Ignore case by default
set ignorecase
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
" Ignore case by default
set ignorecase
" Ability to switch buffers without saving first
set hidden
" Auto update files in the background when changed outside vim
set autoread
" Persist undo tree
set undodir=~/.vim/undodir
set undofile
filetype plugin on

" KEYMAPS
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
map <leader>f :GFiles<CR>
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
