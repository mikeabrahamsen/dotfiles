#!/bin/sh
#
# ~/.xinitrc
#

# load in the Xresources
xrdb -merge ~/.Xresources

# make sure dvorak keyboard is set
# this was a fix after installing awesome 3.5
setxkbmap dvorak &

# start dropbox with delay
sleep 30 && dropboxd &
redshift &

# start awesome windows mananger
exec awesome

xset +fp /usr/share/fonts/local
xset fp rehash
