#!/bin/sh
#
# ~/.xinitrc
#

# load in the Xresources
xrdb -merge ~/.Xresources

# start awesome windows mananger
exec awesome

xset +fp /usr/share/fonts/local
xset fp rehash
