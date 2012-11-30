ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

plugins=(git vi-mode)

export PATH="/usr/local/bin:$PATH"

set -o vi

source $ZSH/oh-my-zsh.sh
source ~/.zprofile
alias sudo="nocorrect sudo"
