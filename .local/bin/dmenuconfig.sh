#!/bin/sh

[ $# -ne 3 ] && echo "Usage: $(basename "$0") <title> <config> <exec>" && exit 1
res=$(sed '/^\s*$/d' "$2" | awk -F',' '{print $1 " | " $2}' | dmenu -p "$1: " -l 20)
[ -z "$res" ] && exit

$3 "$(echo "${res}" | awk -F'|' '{print $2}' | sed 's/\s//')"
