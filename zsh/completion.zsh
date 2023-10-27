# autocomplete config
autoload -U compinit
compinit

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end

# color list
zstyle ':completion:*' list-colors ''

# Menu selection
zstyle ':completion:*:*:*:*:*' menu select

# Smart case matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Cache completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

typeset -ga ZSH_AUTOSUGGEST_STRATEGY=(history completion prefix cursor suffix)
