#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# load in the Xresources
xrdb -merge ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# start awesome windows mananger
exec awesome

xset +fp /usr/share/fonts/local
xset fp rehash
