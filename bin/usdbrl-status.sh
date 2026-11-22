#!/bin/sh

# Print the latest USD/BRL bid rate for i3status.
# Keep the last successful value when the network/API is unavailable.
cache="${XDG_CACHE_HOME:-$HOME/.cache}/i3status-usdbrl"
stamp="${cache}.timestamp"
mkdir -p "$(dirname "$cache")"

update() {
  now=$(date +%s)
  last=0
  [ -r "$stamp" ] && read -r last < "$stamp"

  if [ "$((now - last))" -ge 30 ] || [ ! -r "$cache" ]; then
  value=$(curl -fsS --connect-timeout 3 --max-time 8 \
    'https://economia.awesomeapi.com.br/json/last/USD-BRL' 2>/dev/null \
    | sed -n 's/.*"bid":"\([0-9.]*\)".*/\1/p')

    if [ -n "$value" ]; then
      printf 'US$ %s\n' "$value" > "$cache"
      printf '%s\n' "$now" > "$stamp"
    fi
  fi
}

while :; do
  update
  sleep 30
done
