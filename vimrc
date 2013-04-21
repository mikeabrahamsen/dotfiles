set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github

Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-surround'

filetype plugin indent on
let mapleader=","             " change the leader to be a comma vs slash

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

colorscheme Tomorrow-Night
syntax on                   " use syntax highlighting
set background=dark         " use dark background
set nu                      " show line numbers
set nowrap                  " don't wrap lines
set title                   " show title in title bar
set backup                  " create backups
set backupdir=~/tmp         " set backup folder
set directory=~/tmp         " set directory for swap files
set tabstop=4 shiftwidth=4 expandtab
set softtabstop=4           " use the appropriate number of spaces when tabbing
set shiftround              " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent              " auto indent
set smartindent             " use smart indent if there is no indent file
set list                    " show unprinted characters
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set showmode                " show visual or insert mode
set hlsearch incsearch smartcase "searching preferences,highlight,search as you type
set showmatch               " show matching paratheses
set backspace=indent,eol,start " backspace over anything
set hidden                  " allow hidden buffers
set clipboard=unnamedplus   " easy copying
set ruler                   " show cursor position
set cursorline              " highlight the line the cursor is on
set nostartofline           " preserve cursor location when paging
set ls=2                    " always show status line
imap jj <Esc>

nnoremap <esc> :noh<return><esc>    " turn off search highlight by pushing esc
nnoremap Q <nop>            "unmap Q, typo causes bad results

" to save even when I forget to use sudo
cmap w!! w !sudo tee % >/dev/null

let g:miniBufExplMapWindowNavVim = 1
