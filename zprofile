# Start x at login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# mute beep
xset -b

export EDITOR=vim

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
