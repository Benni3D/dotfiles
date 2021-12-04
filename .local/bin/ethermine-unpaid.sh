#!/bin/sh

unpaid=$(curl "https://api.ethermine.org/miner/06df66cD21e27CAae2777CC2923faEeA63966E47/dashboard" 2>/dev/null |
   grep -o '"unpaid":[0-9]\+' |
   cut -d':' -f2)

course=$(curl "https://api.coinbase.com/v2/prices/ETH-USD/spot" 2>/dev/null |
   sed 's/^.*"amount":"\([0-9]\+\.[0-9]\+\)".*$/\1/')

unpaid_eth=$(echo "scale=5; ${unpaid} / 10^18" | bc | sed 's/^\./0./')
unpaid_usd=$(echo "scale=1; ${unpaid_eth} * ${course}" | bc | awk '{printf "$%.2f", $1}')

course_int=$(echo "${course}" | sed 's/\.[0-9]\+$//')

echo "ETH ${unpaid_eth} [${unpaid_usd}] {\$${course_int}}"
