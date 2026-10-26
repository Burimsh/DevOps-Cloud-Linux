#!/usr/bin/env bash
# 13-mini-watchdog.sh
# Purpose: check internet connectivity every N seconds and log changes.

TARGET="8.8.8.8"       # what to ping
INTERVAL=10            # seconds between checks
last_status=""         # remembers the previous result

# Returns 0 (success) if the ping works, 1 if not
is_online() {
  ping -c 1 -W 2 "$TARGET" >/dev/null 2>&1
}

# Prints a message with a timestamp
log() {
  echo "[$(date '+%H:%M:%S')] $*"
}

while true; do
  if is_online; then
    status="online"
  else
    status="offline"
  fi

  # Only log when the status CHANGES (same idea as set_modem_status)
  if [[ "$status" != "$last_status" ]]; then
    log "status changed: ${last_status:-unknown} -> $status"
    last_status="$status"
  fi

  sleep "$INTERVAL"
done
