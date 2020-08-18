" source the vim plugins file
so ~/.config/nvim/plugins.vim

let mapleader=","             " change the leader to be a comma vs slash

" Reload Vimrc
map <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" easily open the vimrc file
nmap <leader>ev :e $MYVIMRC<CR>

" Set augroup
augroup MyAutoCmd
  autocmd!
augroup END

" toggle spellcheck
nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>S :GrammarousCheck --preview<CR>


" ctrl-jklm  changes to that split
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
tnoremap <c-h> <c-\><c-n><c-w>h

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
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set noshowmode              " don't show mode
set hlsearch incsearch smartcase ignorecase "searching preferences,highlight,search as you type
set showmatch               " show matching paratheses
set backspace=indent,eol,start " backspace over anything
set hidden                  " allow hidden buffers
set clipboard=unnamedplus   " easy copying
set ruler                   " show cursor position
set cursorline              " highlight the line the cursor is on
set nostartofline           " preserve cursor location when paging
set ls=2                    " always show status line
set colorcolumn=80          " add line at column 80
set splitright
set splitbelow
set showcmd

" Always show at least one line above/below the cursor.
set scrolloff=1
" Always show at least one line left/right of the cursor.
set sidescrolloff=5

" Relative line numbers
set number relativenumber

" Auto complete setting
set completeopt=longest,menuone

set wildmode=full
set wildmenu "turn on wild menu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip
set wildignore+=*.pyc,*.pyo
set wildignore+=*/vendor/**
set wildignore+=*/node_modules/**
set wildignore+=*/venv/**

" make text over 79 characters blue
highlight OverLength ctermfg=blue
match OverLength /\%80v.\+/

" set the fileformat to unix for python and c files
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" markdown
let g:markdown_fenced_languages = ['html', 'py=python', 'sh']
let g:markdown_syntax_conceal = 0
autocmd BufNewFile,BufRead *.{md,mkd,mark,markdown} set ft=markdown
au BufRead,BufNewFile *.{md,mark,markdown} setlocal textwidth=80

" remap variations of j and k to use to esc
inoremap jj <Esc>
inoremap jk <esc>
" remap jj in terminal to go to normal mode
tnoremap jj <C-\><C-n>

" split with | and _
nnoremap _ :sp<cr>
nnoremap <bar> :vsp<cr>

" Ctrl-b: Go (b)ack. Go to previously buffer
nnoremap <c-b> <c-^>
nnoremap <leader>w :bprevious<CR>
nnoremap <leader>v :bnext<CR>
" close buffer without closing split
nnoremap <Leader>bd :bp\|bd #<CR> 

" key mappings for fzf
nnoremap <c-p> :GFiles<CR>
nnoremap <leader>p :Files<CR>

"search for word under cursor
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR> 
"search for whole word with punc
nnoremap <silent> <Leader>AG :Ag <C-R><C-A><CR> 

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

" jedi config
let g:jedi#popup_on_dot = 1
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" close the scratch window when you leave
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" turn on deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#enable_short_types = 1
" let g:deoplete#disable_auto_complete = 1
" let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
" let g:deoplete#sources#clang#clang_header = "/usr/bin/"

" exit pages with q even when :q wanted
autocmd MyAutoCmd FileType help,quickrun
      \ if (!&modifiable || &ft==#'quickrun') |
      \ nnoremap <silent> <buffer> q :q<cr>|
      \ nnoremap <silent> <buffer> <esc><esc> :q<cr>|
      \ endif
autocmd MyAutoCmd FileType qf nnoremap <silent> <buffer> q :q<CR>

" Terminal
:au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" functions
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

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

"" Remove all text except what matches the current search result
"" The opposite of :%s///g (which clears all instances of the current search).
function! ClearAllButMatches()
    let old = @c
    let @c=""
    %s//\=setreg('C', submatch(0), 'l')/g
    %d _
    put c
    0d _
    let @c = old
endfunction

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType vue setlocal shiftwidth=2 tabstop=2
