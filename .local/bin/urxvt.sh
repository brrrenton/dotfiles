#!/bin/sh

# Spawn a new tab

WID=$(xdpyinfo | grep focus | cut -d " " -f 4 | cut -d "," -f 1)
CLASS=$(xprop -id $WID | grep WM_CLASS | cut -f 2 -d '"')

# If the currently focused window is rxvt-unicode:
if [ "$CLASS" = "urxvt" ]; then
  # Replace "URXVT_CWD" with the working directory of the terminal
  PID=$(xprop -id $WID | grep _NET_WM_PID | cut -d " " -f 3)
  BASH_PID=$(pstree -paA $PID | grep -m 1 bash | cut -f 2 -d ",")  
  URXVT_CWD=$(readlink /proc/$BASH_PID/cwd)

fi

# Run rxvt-unicode
eval urxvt -cd \"$URXVT_CWD\" -embed $1

