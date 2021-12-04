#!/bin/sh

[ "$TERM" != "st-256color" -a "$TERM" != "xterm-256color" ] && st "$0" && exit

if [ $# -lt 1 ]; then
   ls --color=yes "$HOME/Documents/Schule"
   printf "Fach: "
   read fach
else
   fach="$1"
fi

[ -z "$fach" ] && exit
   
path="$HOME/Documents/Schule/$fach/$(date +%F)"
mkdir -p "$path"
cd "$path"
$SHELL
