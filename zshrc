ZSH=$HOME/.zsh

bindkey -e

# source files
source ~/.zprofile
source ~/.aliases
source $ZSH/git_prompt.zsh
source $ZSH/completion.zsh
source $ZSH/history.zsh
source $ZSH/git_flow_completion.zsh

[ -d ~/.bin ] && export PATH=~/.bin:$PATH

# virtualenv wrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

