#!/bin/sh
# Output: 300MHz/450MHz

modules() {
   cut -d' ' -f1 /proc/modules
}

detect_driver() {
   if modules | grep -q '^nvidia$'; then
      echo 'nvidia'
   elif modules | grep -q '^nouveau$'; then
      echo 'nouveau'
   else
      echo 'none'
   fi
}

speed() {
   case "$(detect_driver)" in
   nvidia)
      local clocks gpu_clock mem_clock
      clocks="$(nvidia-settings -q GPUCurrentClockFreqs | grep -om1 '[0-9]\+\,[0-9]\+')"
      gpu_clock="$(echo "${clocks}" | cut -d',' -f1)"
      mem_clock="$(echo "${clocks}" | cut -d',' -f2)"
      echo "${gpu_clock}MHz/${mem_clock}MHz"
      ;;
   nouveau)
      echo "nouveau"
      ;;
   none)
      echo "no GPU"
      ;;
   esac
}

heat() {
   local tmp
   case "$(detect_driver)" in
   nvidia)
      tmp="$(nvidia-settings -q GPUCoreTemp | grep -om1 '[0-9]\+\.$')"
      echo "${tmp}0°C"
      ;;
   nouveau)
      tmp="$(cat '/sys/class/thermal/thermal_zone1/hwmon6/temp1_input')"
      echo "$((tmp / 1000)).0°C"
      ;;
   none)
      echo "no GPU"
      ;;
   esac
}

case "$1" in
-s)
   speed
   ;;
-H)
   heat
   ;;
-h)
   echo "$(basename "$0") [-s|-H]"
   ;;
esac
