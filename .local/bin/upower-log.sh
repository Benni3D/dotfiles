#!/bin/sh

log="$HOME/.local/share/upower.log"
dump="$(upower --dump)"

get() {
   echo "${dump}" | grep -Fm1 "$1:" | cut -d':' -f2 | sed 's/\s*//g'
}

print_log() {
   printf "[%s]: voltage=%s energy=%s(%s) cap=%s(%s)\n"   \
      "$(date +"%F %T")"                     \
      "$(get voltage)"                       \
      "$(get energy)"                        \
      "$(get percentage)"                    \
      "$(get energy-full)"                   \
      "$(get capacity)"                      \
      | tee -a "${log}"
}

while true; do
   print_log
   sleep $((4 * 60 * 60))  # Sleep for 4h
done
