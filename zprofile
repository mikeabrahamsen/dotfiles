# Start x at login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

