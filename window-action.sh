#!/bin/bash

eval $(xdotool getactivewindow getwindowgeometry --shell)

SW=1920
SH=1080
HH=26    # header height
MX=80    # left margin on left display

if [ "$1" = "move" ]; then
  if [ "$2" = "right" ]; then xdotool getactivewindow windowmove $((X+SW)) $Y; fi
  if [ "$2" = "left" ]; then xdotool getactivewindow windowmove $((X-SW)) $Y; fi
elif [ "$1" = "enlarge" ]; then
  if [ $X -ge $SW ]; then X0=$SW;XW=$SW; else X0=$MX;XW=$((SW - X0)); fi
  xdotool getactivewindow windowmove $X0 -$HH windowsize $XW $((SH + $HH))
elif [ "$1" = "dock" ]; then
  if [ $X -ge $SW ]; then X0=$SW;XW=$SW; else X0=$MX;XW=$((SW - X0)); fi
  if [ "$2" = "bottom" ]; then
    xdotool getactivewindow windowmove $X0 $((SH / 2)) windowsize $XW $((SH / 2))
  elif [ "$2" = "top" ]; then
    xdotool getactivewindow windowmove $X0 -$HH windowsize $XW $((SH / 2))
  fi
elif [ "$1" = "shrink" ]; then
  if [ $X -ge $SW ]; then DW=$SW; else DW=0; fi
  xdotool getactivewindow windowmove $((SW/4 + DW)) $((SH/4)) windowsize $((SW/2)) $((SH/2))
elif [ "$1" = "min" ]; then xdotool getactivewindow windowminimize; fi
fi