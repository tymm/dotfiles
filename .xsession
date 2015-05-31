#!/bin/sh

export PATH=/usr/local/sbin:/home/tymm/bin:/opt/android-sdk/tools:/opt/android-sdk/platform-tools:$PATH

setxkbmap -option terminate:ctrl_alt_bksp
xsetroot -cursor_name left_ptr
setxkbmap -layout de
xrdb -merge ~/.Xresources
xset b off
