set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
autocmd vimenter * NERDTree
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'morhetz/gruvbox'
Plugin 'mileszs/ack.vim'
Plugin 'stsewd/fzf-checkout.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'unkiwii/vim-nerdtree-sync'
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
Plugin 'blueyed/vim-diminactive'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
"Plugin 'tpope/vim-fugitive'

"Color Scheme"
"Plugin 'gruvbox-community/gruvbox'
"Plug 'dracula/vim', { 'as': 'dracula' }
Plugin 'sheerun/vim-polyglot'
Plugin 'colepeters/spacemacs-theme.vim'

"Plug 'sainnhe/gruvbox-material' "somehow this is laggy
"Plug 'phanviet/vim-monokai-pro'
Plugin 'flazz/vim-colorschemes'
Plugin 'chriskempson/base16-vim'

"lsp
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'

"auto-linting
Plugin 'dense-analysis/ale'

call vundle#end()
colorscheme gruvbox
filetype plugin indent on
filetype plugin on
highlight Normal ctermbg=0





let g:lsp_diagnostics_echo_cursor = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:fzf_layout = { 'window': { 'window': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"

let g:ale_fixers = {
      \'javascript': ['eslint'],
      \'json': ['prettier'],
      \'typescript': ['eslint'],
      \'typescriptreact': ['eslint'],
      \'markdown': ['prettier'],
      \'css': ['stylelint'],
      \'scss': ['stylelint']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeQuitOnOpen=0

set bg=dark
set number
set autoindent
set expandtab
set encoding=utf-8
set guicursor=
set relativenumber
"set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set cursorline
set cursorcolumn
set splitright
