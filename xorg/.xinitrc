#!/bin/sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export XDG_CONFIG_HOME="$HOME/.config"

DEFAULT_SESSION='i3 --shmlog-size 0'

# xset r rate 133 45
xset r rate 200 50
xset -b
xmodmap -e "pointer = 3 2 1 4 5 16 17 8 9 10 11 12 13 14 15 6 7 18 19 20 21 22 23 24"

exec i3
