call pathogen#infect()
syntax on
filetype plugin indent on

colorscheme Tomorrow-Night
set background=dark
set nu
set nowrap
set title
set nobackup
set tabstop=4 shiftwidth=4 expandtab
set shiftround
set autoindent
set copyindent
set smarttab
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set showmode
set hlsearch incsearch smartcase "searching preferences,highlight,search as you type
set showmatch
set backspace=indent,eol,start
set hidden
set clipboard=unnamedplus
set ruler

imap jj <Esc>

nnoremap Q <nop> "unmap Q, typo causes bad results
cmap w!! w !sudo tee % >/dev/null
let g:miniBufExplMapWindowNavVim = 1
