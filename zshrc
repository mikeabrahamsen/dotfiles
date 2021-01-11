ZSH=$HOME/.zsh

bindkey -e

# source files
source ~/.zprofile
source ~/.aliases
source $ZSH/git_prompt.zsh
source $ZSH/completion.zsh
source $ZSH/history.zsh
source $ZSH/git_flow_completion.zsh
source /usr/share/zsh/plugins/

[ -d ~/.bin ] && export PATH=~/.bin:$PATH

# virtualenv wrapper
export WORKON_HOME=~/.virtualenvs

# php composer
export PATH=~/.config/composer/vendor/bin:$PATH

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
