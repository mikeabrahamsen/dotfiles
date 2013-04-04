set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle man***REMOVED***e Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github

Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on

let mapleader=","             " change the leader to be a comma vs slash

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

syntax on
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
set noswapfile

imap jj <Esc>

nnoremap Q <nop> "unmap Q, typo causes bad results

" to save even when I forget to use sudo
cmap w!! w !sudo tee % >/dev/null

let g:miniBufExplMapWindowNavVim = 1
