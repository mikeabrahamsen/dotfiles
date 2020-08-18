call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
"Plug 'SirVer/ultisnips'
Plug 'nvie/vim-flake8'
Plug 'hynek/vim-python-pep8-indent'

" auto complete
Plug 'davidhalter/jedi-vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'

" Language specific auto complete
"Plug 'zchee/deoplete-clang' "c and c++
"Plug 'zchee/deoplete-jedi'  "python


Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" C++
Plug 'octol/vim-cpp-enhanced-highlight'


" Writing tools
Plug 'rhysd/vim-grammarous'
call plug#end()
