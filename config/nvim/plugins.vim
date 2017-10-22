call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'SirVer/ultisnips'
Plug 'nvie/vim-flake8'
Plug 'hynek/vim-python-pep8-indent'
Plug 'suan/vim-instant-markdown'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Langu***REMOVED***e specific auto complete
Plug 'zchee/deoplete-clang' "c and c++
Plug 'zchee/deoplete-jedi'  "python

Plug 'Shougo/vimproc.vim' "README
Plug 'marijnh/tern_for_vim' "README


Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" php
Plug 'StanAngeloff/php.vim'
Plug 'jwalton512/vim-blade'

Plug 'suan/vim-instant-markdown'

" C++
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()
