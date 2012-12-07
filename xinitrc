#!/bin/sh
#
# ~/.xinitrc
#

# load in the Xresources
xrdb -merge ~/.Xresources

# start dropbox with delay
sleep 30 && dropboxd &

# start awesome windows mananger
exec awesome

xset +fp /usr/share/fonts/local
xset fp rehash
