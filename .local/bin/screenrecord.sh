#!/bin/sh

[ $# -ne 1 ] && echo "Usage: $0 <output-file>" && exit 1
ffmpeg -f x11grab -s 1920x1080 -i :0.0 -f alsa -i default -r 30 -c:a flac $1
