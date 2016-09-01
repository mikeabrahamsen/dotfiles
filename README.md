# Installation Instructions
1. Clone the repo `git clone https://github.com/mikeabrahamsen/dotfiles.git ~/dotfiles`
2. Install vundle `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
3. Rake install `cd ~/dotfiles; rake install`
4. Configure vimproc `cd ~/dotfiles/vim/bundle/vimproc.vim/; make`
5. Configure tern for vim `cd ~/dotfiles/vim/bundle/tern_for_vim/; npm install`
6. Symlink for neovim
```sh
$ mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
$ ln -s ~/.vim $XDG_CONFIG_HOME/nvim
$ ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
```
