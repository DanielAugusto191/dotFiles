#!/bin/sh

device="41:42:F0:E3:A8:26"
state_dir="${XDG_CACHE_HOME:-$HOME/.cache}/bluetooth-battery"
state_file="$state_dir/low-notified"

mkdir -p "$state_dir"

battery=$(bluetoothctl info "$device" 2>/dev/null |
  awk -F'[()]' '/Battery Percentage/ {print $2; exit}')

case "$battery" in
  ''|*[!0-9]*)
    printf '{"text":"BT --%%","tooltip":"Bluetooth battery unavailable"}\n'
    exit 0
    ;;
esac

if [ "$battery" -le 10 ]; then
  if [ ! -e "$state_file" ]; then
    notify-send -u critical "Bluetooth device low battery" "Battery: ${battery}%"
    : > "$state_file"
  fi
else
  rm -f "$state_file"
fi

printf '{"text":"BT %s%%","tooltip":"Bluetooth device battery: %s%%"}\n' "$battery" "$battery"
