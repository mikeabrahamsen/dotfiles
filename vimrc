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
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/unite-help'
Plugin 'Shougo/unite-session'

Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/vimproc.vim' "README
Plugin 'Shougo/neomru.vim'

Plugin 'marijnh/tern_for_vim' "README
Plugin 'pangloss/vim-javascript'
Plugin 'matthewsimo/angular-vim-snippets'

call vundle#end()

filetype plugin indent on
let mapleader=","             " change the leader to be a comma vs slash

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

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
set nostartofline           " preserve cursor location when paging
set ls=2                    " always show status line
set colorcolumn=80          " add line at column 80
set splitright
set splitbelow
set showcmd

" toggle paste mode
noremap <silent> <Leader>1 :set paste!<cr>:set paste?<CR>

" Auto complete setting
set completeopt=longest,menuone

set wildmode=list:longest,full
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
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
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
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" -----------------------------------------------------------
" Unite config
" -----------------------------------------------------------

" use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'tmp/',
      \ '.sass-cache',
      \ 'node_modules/',
      \ 'bower_components/',
      \ 'coverage/',
      \ 'dist/',
      \ '.git5_specs/',
      \ '.pyc',
      \ ], '\|'))

" map space to the prefix for unite
nnoremap [unite] <Nop>
nmap <space> [unite]

" <F4>: Save session
nnoremap <F4> :<C-u>UniteSessionSave

nmap <F1> [unite]h

" Ctrl-e: Find everything
nmap <c-e> [unite]f

" Ctrl-/ Better search
nmap <c-_> [unite]l

" Ctrl-p find MRU and buffers
nmap <c-p> [unite]u

" Ctrl-\ outline
nmap <silent> <c-\> [unite]o

" Ctrl-c change current dir
nmap <c-c> [unite]d

" General fuzzy search
nnoremap <silent> [unite]<space> :<C-u>Unite
      \ -buffer-name=files buffer file_mru bookmark file_rec/async<CR>

" Quick help
nnoremap <silent> [unite]h :<C-u>Unite -buffer-name=help help<CR>
" Quick buffers mru
nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=buffers buffer file_mru <CR>
" Quick file search
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>
" Quick line
nnoremap <silent> [unite]l :<C-u>Unite -buffer-name=search_file line<CR>
" Quick MRU search
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>
" Quick find
nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find find:.<CR>
" Quick outline
nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical outline<CR>
" Quickly switch lcd
nnoremap <silent> [unite]d
      \ :<C-u>Unite -buffer-name=change-cwd -default-action=cd directory_mru directory_rec/async<CR>
" Quick snippet
nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=snippets ultisnips<CR>
" Quick registers
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" Quick sessions (projects)
nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=sessions session<CR>
" Quick sources
nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=sources source<CR>
" Quick find
nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find find:.<CR>
" Quick commands
nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

" Start in insert mode
let g:unite_enable_start_insert = 1

let g:unite_data_directory = "~/.unite"

" Enable short source name in window
" let g:unite_enable_short_source_names = 1

" Enable history yank source
let g:unite_source_history_yank_enable = 1

" Open in bottom right
let g:unite_split_rule = "botright"

" Shorten the default update date of 500ms
let g:unite_update_time = 200

let g:unite_source_file_mru_limit = 500

let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''

" Save session automatically.
let g:unite_source_session_enable_auto_save = 1

" Custom Unite settings
autocmd MyAutoCmd FileType unite call s:unite_settings()
function! s:unite_settings()
  let unite = unite#get_current_unite()
  if unite.buffer_name =~# '^search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')

  " Using Ctrl-\ to trigger outline, so close it using the same keystroke
  if unite.buffer_name =~# '^outline'
    imap <buffer> <C-\> <Plug>(unite_exit)
  endif

  " Using Ctrl-/ to trigger line, close it using same keystroke
  if unite.buffer_name =~# '^search_file'
    imap <buffer> <C-_> <Plug>(unite_exit)
  endif
endfunction

" Pop up session selection if no file is specified
autocmd MyAutoCmd VimEnter * call s:unite_session_on_enter()
function! s:unite_session_on_enter()
  if !argc() && !exists("g:start_session_from_cmdline")
    Unite -buffer-name=sessions session
  endif
endfunction

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
