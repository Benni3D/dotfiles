#!/bin/sh

[ $# -ne 2 ] && echo "Usage: $0 /dev/videoN file" && exit 1

ffmpeg -loop 1 -re -i $2 -f v4l2 -vcodec rawvideo -pix_fmt yuv420p $1
