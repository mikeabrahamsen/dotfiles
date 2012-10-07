ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

plugins=(git)

export PATH="/usr/local/bin:$PATH"

source $ZSH/oh-my-zsh.sh
alias sudo="nocorrect sudo"