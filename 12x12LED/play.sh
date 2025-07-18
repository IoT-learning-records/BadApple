#!/bin/bash

FRAME_DIR="./led_txt"
EOY="/sys/class/xr-led/device/eoy"
LED="/sys/class/xr-led/device/led"
DELAY=0.1

for frame in $(ls "$FRAME_DIR"/frame_*.txt | sort); do
    cat "$frame" > "$EOY"
    echo 1 > "$LED"
    sleep $DELAY
done
