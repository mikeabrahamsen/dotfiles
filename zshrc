ZSH=$HOME/.zsh

# source files
source ~/.zprofile
source ~/.aliases
source $ZSH/git_prompt.zsh
source $ZSH/completion.zsh

[ -d ~/.bin ] && export PATH=~/.bin:$PATH

# virtualenv wrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

