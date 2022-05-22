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

" LSP ---------------------------------------------------------------- {{{
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  require("nvim-lsp-installer").setup {
    automatic_installation = true  
  }
  local lspconfig = require('lspconfig')
  lspconfig.tsserver.setup{}
EOF
" }}}
