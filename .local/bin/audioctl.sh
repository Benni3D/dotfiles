#!/bin/sh

[ $# -lt 1 ] && echo "Usage: $0 [toggle|mute|up|down]" && exit 1

case "$1" in
   toggle)  pulsemixer --toggle-mute      ;;
   mute)    pulsemixer --mute             ;;
   up)      pulsemixer --change-volume +5 ;;
   down)    pulsemixer --change-volume -5 ;;
esac

pkill --signal SIGUSR1 dwm-status
