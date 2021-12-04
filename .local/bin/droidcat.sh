#!/bin/sh

[ $# -ne 1 ] && echo "Usage: $0 <device>" && exit 1

mpv "av://v4l2:$1" --profile=low-latency --untimed

