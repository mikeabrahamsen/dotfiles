#!/bin/sh
#
# ~/.xinitrc
#

# if [ -d /etc/X11/xinit/xinitrc.d ]; then
#   for f in /etc/X11/xinit/xinitrc.d/*; do
#     [ -x "$f" ] && . "$f"
#   done
#   unset f
# fi
# 
# load in the Xresources
xrdb -merge ~/.Xresources

# start i3 windows mananger and enable logging
# exec i3 -V >> ~/var/log/i3log 2>&1
exec i3
