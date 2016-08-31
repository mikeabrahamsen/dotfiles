set nocompatible               " be iMproved

" source the vim plugins file
so ~/.vim/plugins.vim

let mapleader=","             " change the leader to be a comma vs slash

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" easily open the vimrc file
nmap <leader>ev :e $MYVIMRC<CR>

" Set augroup
augroup MyAutoCmd
  autocmd!
augroup END

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
set backupcopy=yes
set backupdir=~/tmp         " set backup folder
set directory=~/tmp         " set directory for swap files
set tabstop=4 shiftwidth=4 expandtab
set softtabstop=4           " use the appropriate number of spaces when tabbing
set shiftround              " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent              " auto indent
set list                    " show unprinted characters
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set noshowmode              " don't show mode
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
set splitright
set splitbelow
set showcmd

" toggle paste mode
noremap <silent> <Leader>1 :set paste!<cr>:set paste?<CR>

" Auto complete setting
set completeopt=longest,menuone

set wildmode=full
set wildmenu "turn on wild menu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip
set wildignore+=*.pyc,*.pyo

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

" split with | and _
nnoremap _ :sp<cr>
nnoremap <bar> :vsp<cr>

" Ctrl-b: Go (b)ack. Go to previously buffer
nnoremap <c-b> <c-^>
nnoremap <leader>w :bprevious<CR>
nnoremap <leader>v :bnext<CR>

" resize splits
nnoremap <space>= <c-w>=
nnoremap <leader>m <C-w>_<C-w><Bar>
nnoremap <leader>M <C-w>=

" window navigation
nmap <Left> <C-w>h
nmap <Down> <C-w>j
nmap <Up> <C-w>k
nmap <Right> <C-w>l


" Ctrl-c: Inserts line below
inoremap <c-c> <c-o>o
" Creating new lines without comment leader
nmap go o<Esc>S
nmap gO O<Esc>S

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
let g:syntastic_check_on_wq = 0
" must have flake8 installed through pip2
let g:syntastic_python_checkers = ['flake8']

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#max_list = 5
set completeopt-=preview

let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled=0
let g:tern_show_signature_in_pum=1

let g:instant_markdown_autostart = 0

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteT***REMOVED***s
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteT***REMOVED***s

" othree/javascript-libraries-syntax.vim config
let g:used_javascript_libs = 'angularjs,underscore,jasmine'

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

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()

" exit p***REMOVED***es with q even when :q wanted
autocmd MyAutoCmd FileType help,quickrun
      \ if (!&modifiable || &ft==#'quickrun') |
      \ nnoremap <silent> <buffer> q :q<cr>|
      \ nnoremap <silent> <buffer> <esc><esc> :q<cr>|
      \ endif
autocmd MyAutoCmd FileType qf nnoremap <silent> <buffer> q :q<CR>

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
