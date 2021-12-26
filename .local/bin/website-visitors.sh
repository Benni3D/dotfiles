#!/bin/sh

echo "$(curl "https://stuerz.xyz/visitor-stats.html" | sed 's/^Total: \([0-9]\+\).*$/\1/;q') Visitors"
