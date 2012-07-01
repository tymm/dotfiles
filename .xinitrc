#!/bin/sh

# use external monitor if connected
if [ "$(xrandr | grep -oE "VGA1 connected")" = "VGA1 connected" ]; then xrandr --output LVDS1 --off; fi

setxkbmap -option terminate:ctrl_alt_bksp
xsetroot -cursor_name left_ptr
setxkbmap -layout de
exec xmonad 
