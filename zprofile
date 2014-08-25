# Start x at login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

export EDITOR=vim

# mute beep
xset -b

# don't blank screen
xset s off

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
