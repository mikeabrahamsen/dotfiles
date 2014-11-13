ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE=true

plugins=(git git-flow)

source ~/.zprofile
source ~/.aliases
source $ZSH/oh-my-zsh.sh
source ~/.git-flow-completion.zsh

[ -d ~/.bin ] && export PATH=~/.bin:$PATH

# virtualenv wrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

