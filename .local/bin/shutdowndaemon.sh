#!/bin/sh

battery="BAT0"
dir="/sys/class/power_supply/$battery"
audio="/usr/local/share/benni/timer.wav"

notified=0

while true; do
   charge=$(($(cat "$dir/charge_now") * 100 / $(cat "$dir/charge_full")))
   status=$(cat "$dir/status")
   [ $charge -ge 75 ] && sleep 20m && continue
   if [ "$status" = "Discharging" ]; then 
      [ $charge -lt 5 ] && sudo shutdown now
      [ $charge -lt 15 ] && [ $notified -ne 1 ] && notified=1 && notify-send -u critical "Battery almost empty" && aplay "$audio"
   else notified=0; fi
   sleep 120s
done
