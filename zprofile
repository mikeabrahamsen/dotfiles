# Start x at login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# mute beep
xset -b

export EDITOR=vim
export PATH="/usr/local/bin:$PATH:$HOME/.gem/ruby/1.9.1/bin"

