#!/bin/sh
#
# ~/.xinitrc
#

# load in the Xresources
xrdb -merge ~/.Xresources

# Ensure this session is treated as X11 (startx commonly leaves systemd --user thinking it's "tty")
export XDG_SESSION_TYPE=x11
export XAUTHORITY="${XAUTHORITY:-$HOME/.Xauthority}"

# Export X session env to systemd user services + DBus activation (fixes xdg-desktop-portal-gtk "cannot open display")
systemctl --user import-environment DISPLAY XAUTHORITY XDG_SESSION_TYPE XDG_CURRENT_DESKTOP
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY XDG_SESSION_TYPE XDG_CURRENT_DESKTOP

# Restart portals so they pick up the updated environment
systemctl --user restart xdg-desktop-portal xdg-desktop-portal-gtk

# start i3 window manager
exec i3
