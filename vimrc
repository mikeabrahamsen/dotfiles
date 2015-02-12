set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
" My Bundles here:
"
" original repos on github

Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'SirVer/ultisnips'
Plugin 'nvie/vim-flake8'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'suan/vim-instant-markdown'
Plugin 'honza/vim-snippets'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/unite.vim'
Plugin 'davidhalter/jedi-vim'

Plugin 'pangloss/vim-javascript'
Plugin 'matthewsimo/angular-vim-snippets'

call vundle#end()

filetype plugin indent on
let mapleader=","             " change the leader to be a comma vs slash

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" toggle spellcheck
nmap <silent> <leader>s :set spell!<CR>

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
set list                    " show unprinted characters
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set showmode                " show visual or insert mode
set hlsearch incsearch smartcase ignorecase "searching preferences,highlight,search as you type
set showmatch               " show matching paratheses
set backspace=indent,eol,start " backspace over anything
set hidden                  " allow hidden buffers
set clipboard=unnamedplus   " easy copying
set ruler                   " show cursor position
set cursorline              " highlight the line the cursor is on
set nostartofline           " preserve cursor location when p***REMOVED***ing
set ls=2                    " always show status line
set colorcolumn=80          " add line at column 80


" make text over 79 characters red
highlight OverLength ctermfg=red
match OverLength /\%80v.\+/

" set the fileformat to unix for python and c files
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

autocmd BufNewFile,BufRead *.{md,mkd,mark,markdown} set ft=markdown
au BufRead,BufNewFile *.{md,mark,markdown} setlocal textwidth=80

" remap variations of j and k to use to esc
inoremap jj <Esc>
inoremap jk <esc>

" turn off search highlight by pushing enter
nnoremap <CR> :noh<CR><CR>
"unmap Q, typo causes bad results
nnoremap Q <nop>

" to save even when I forget to use sudo
cmap w!! w !sudo tee % >/dev/null

" ultinsnips config
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsListSnippets = '<C-l>'
let g:ultisnips_python_style = 'sphinx'

" syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
" must have flake8 installed through pip2
let g:syntastic_python_checkers = ['flake8']

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#max_list = 5

let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled=0

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteT***REMOVED***s
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteT***REMOVED***s

" unite config
nnoremap <C-l> :Unite file file_rec buffer<CR>

" othree/javascript-libraries-syntax.vim config
let g:used_javascript_libs = 'angularjs,underscore'

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()
