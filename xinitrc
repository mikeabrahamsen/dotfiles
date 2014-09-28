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

# start i3 windows mananger and enable logging
exec i3 -V >> ~/.i3/i3log 2>&1

xse +fp /usr/share/fonts/local
xset fp rehash

# key remaps
xmodmap ~/.xmodmaprc
