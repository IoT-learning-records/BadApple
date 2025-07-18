#!/bin/bash

EOY="/sys/class/xr-led/device/eoy"
LED="/sys/class/xr-led/device/led"
DELAY=0.1

full_on=""
for ((i=0; i<12; i++)); do
    line="120 120 120 120 120 120 120 120 120 120 120 120"
    full_on="${full_on}${line}\n"
done

while true; do
    echo -e "$full_on" > "$EOY"
    echo 1 > "$LED"
    sleep $DELAY
done
