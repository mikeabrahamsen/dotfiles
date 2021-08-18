ZSH=$HOME/.zsh

bindkey -e

# source files
source ~/.zprofile
source ~/.aliases
source $ZSH/git_prompt.zsh
source $ZSH/completion.zsh
source $ZSH/history.zsh
source $ZSH/git_flow_completion.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -d ~/.bin ] && export PATH=~/.bin:$PATH

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc
