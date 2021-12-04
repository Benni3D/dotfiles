#!/bin/sh

choosen=$(echo "Lock\nShutdown\nReboot\nRestart Xmonad\nExit Xmonad" | dmenu -l 5)

case "$choosen" in
Lock)
   slock
   ;;
Shutdown)
	sudo poweroff
	;;
Reboot)
	sudo reboot
	;;
"Restart Xmonad")
   xmonad --restart
	;;
"Exit Xmonad")
   pkill -TERM xmonad
	;;
esac

