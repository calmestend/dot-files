#!/bin/sh

while true
do
    hour_minute_second=$(date "+%H:%M:%S")
    date_today=$(date "+%a %b %d")

	FREE_DATA=$(free -m | grep Mem)
    CURRENT=$(echo $FREE_DATA | awk '{print $3}')
    TOTAL=$(echo $FREE_DATA | awk '{print $2}')


    RAM_USAGE=$(echo "scale=2; $CURRENT/$TOTAL*100" | bc)
    CPU_USAGE=$(top -b -n1 | awk '/Cpu\(s\)/ {print $2 + $4}')

    xsetroot -name "CPU: ${CPU_USAGE}% | RAM: ${RAM_USAGE}% | ${date_today} | ${hour_minute_second} "
done
