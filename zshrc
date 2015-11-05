ZSH=$HOME/.zsh

DISABLE_AUTO_TITLE=true

source ~/.zprofile
source ~/.aliases
source $ZSH/git_prompt.zsh

[ -d ~/.bin ] && export PATH=~/.bin:$PATH

# virtualenv wrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

