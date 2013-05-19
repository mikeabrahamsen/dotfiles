ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_LS_COLORS="true"

plugins=(git vi-mode)

set -o vi

source $ZSH/oh-my-zsh.sh
source ~/.zprofile

# alias
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -I"

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias sudo="nocorrect sudo"

# todo alias
alias t="todo.sh"
alias ta="todo.sh add"
alias tl="todo.sh list"
alias td="todo.sh do"
alias tr="todo.sh rm"
