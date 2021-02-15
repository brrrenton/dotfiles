#!/bin/sh

# Spawn a new terminal

WID=$(xdpyinfo | grep focus | cut -d " " -f 4 | cut -d "," -f 1)
CLASS=$(xprop -id $WID | grep WM_CLASS | cut -f 2 -d '"')

# If the currently focused window is rxvt-unicode:
if [ "$CLASS" = "urxvt" ]; then
  # Set "URXVT_CWD" to the working directory of the terminal
  PID=$(xprop -id $WID | grep _NET_WM_PID | cut -d " " -f 3)
  BASH_PID=$(pstree -paA $PID | grep -m 1 bash | cut -f 2 -d ",")  
  URXVT_CWD=$(readlink /proc/$BASH_PID/cwd)

else
  # Otherwise the "URXVT_CWD" to ~/
  URXVT_CWD=$HOME

fi

# Run tabbed
URXVT_CWD=$URXVT_CWD exec tabbed -c urxvt.sh

