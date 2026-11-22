#!/bin/bash

THRESHOLD=$1
THRESHOLD2=$2
INTERVAL=30

while true; do
    MEM_TOTAL=$(free -m | awk '/^Mem:/ {print $2}')
    MEM_AVAILABLE=$(free -m | awk '/^Mem:/ {print $7}')
    MEM_USED_PCT=$(( 100 * (MEM_TOTAL - MEM_AVAILABLE) / MEM_TOTAL ))

    if [ "$MEM_USED_PCT" -ge "$THRESHOLD" ]; then
        TOP_PROCESS=$(ps -eo comm,%mem --sort=-%mem | head -n 2 | tail -n 1)
        PROC_NAME=$(echo "$TOP_PROCESS" | awk '{print $1}')
        PROC_MEM=$(echo "$TOP_PROCESS" | awk '{print $2}')
        notify-send -u critical "Mid Memory Alert: ${MEM_USED_PCT}% Used" "The top process is $PROC_NAME taking $PROC_MEM% of total memory."
    fi

    if [ "$MEM_USED_PCT" -ge "$THRESHOLD2" ]; then
        TOP_PROCESS=$(ps -eo comm,%mem --sort=-%mem | head -n 2 | tail -n 1)
        PROC_NAME=$(echo "$TOP_PROCESS" | awk '{print $1}')
        PROC_MEM=$(echo "$TOP_PROCESS" | awk '{print $2}')
        notify-send -u critical "High Memory Alert: ${MEM_USED_PCT}% Used" "The top process is $PROC_NAME taking $PROC_MEM% of total memory."
    fi
    sleep "$INTERVAL"
done

