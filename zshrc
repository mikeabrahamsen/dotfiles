ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE=true

plugins=(git git-flow)

source ~/.zprofile
source $ZSH/oh-my-zsh.sh
source ~/.git-flow-completion.zsh
source ~/.bin/tmuxinator.zsh

# virtualenv wrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

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

# git alias not in oh-my-zsh git plugin
alias gl="git log --graph --pretty=oneline --abbrev-commit"
