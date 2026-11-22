while true; do
  BAT=$(bluetoothctl info 41:42:F0:E3:A8:26 | grep Battery | tr -d '\r' | awk -F'[()]' '{print $2}')
  if [ "$BAT" -lt "20" ]; then
    notify-send -u critical "USB Phone low battery!"
  fi
  echo Btooth Batt $BAT% > ~/d
  sleep 600
done
