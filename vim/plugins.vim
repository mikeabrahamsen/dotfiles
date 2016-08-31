filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-vinegar'
Plugin 'SirVer/ultisnips'
Plugin 'nvie/vim-flake8'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'suan/vim-instant-markdown'
Plugin 'honza/vim-snippets'

Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/vimproc.vim' "README

Plugin 'marijnh/tern_for_vim' "README
Plugin 'matthewsimo/angular-vim-snippets'

Plugin 'bling/vim-airline'
Plugin 'ton/vim-bufsurf'

Plugin 'StanAngeloff/php.vim'

call vundle#end()
filetype plugin indent on
