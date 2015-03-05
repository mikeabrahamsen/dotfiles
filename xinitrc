#!/bin/sh
#
# ~/.xinitrc
#

# load in the Xresources
xrdb -merge ~/.Xresources

# start i3 windows mananger and enable logging
exec i3 -V >> ~/.i3/i3log 2>&1
