#!/bin/sh

fix_inet() {
   while true; do
      sleep 4h
      #if ! ping -c1 1.1.1.1; then
      #   sudo rc-service wifi restart
      #   sudo rc-service wifi restart
      #fi
      sudo kill $(pgrep -x ethminer | head -n1)
   done
}

run_ethminer() {
   sudo "$(dirname "$0")"/ethminer -UP stratum://0x06df66cD21e27CAae2777CC2923faEeA63966E47.lappengrill@eu1.ethermine.org:4444
}

#fix_inet &

while true; do
   run_ethminer
   sleep 5
done
