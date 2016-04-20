#!/bin/sh

# GDM does not start .xsession on default
# Edit /usr/share/xsessions/i3.desktop for that: "Exec=/etc/X11/Xsession"

xrdb -merge ~/.Xresources
exec i3
