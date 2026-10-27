#!/usr/bin/env bash
# 13-mini-watchdog.sh
# Purpose: check internet connectivity every N seconds and log changes.

# List of addresses to ping. The FIRST one is a fake address (it never
# answers), used to test that the script moves on to the next one.
TARGETS=("1.1.1.1" "8.8.8.8")
INTERVAL=10            # seconds between checks
last_status=""         # remembers the previous result

# Returns 0 (success) if ANY target answers, 1 if none do
is_online() {
  local target
  for target in "${TARGETS[@]}"; do
    if ping -c 1 -W 2 "$target" >/dev/null 2>&1; then
      return 0      # one answered: online, stop checking
    fi
  done
  return 1          # none answered: offline
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

  # Only log when the status CHANGES
  if [[ "$status" != "$last_status" ]]; then
    log "status changed: ${last_status:-unknown} -> $status"
    last_status="$status"
  fi

  sleep "$INTERVAL"
done
