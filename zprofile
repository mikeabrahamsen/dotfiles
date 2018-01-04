# Start x at login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

export EDITOR=nvim
export PATH=~/.npm-global/bin:$PATH
eval $(keychain --eval --quiet id_rsa)
