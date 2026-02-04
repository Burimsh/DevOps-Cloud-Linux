#!/bin/bash
set -euo pipefail

TARGET=10.0.0.2

echo "[TEST] Pinging $TARGET"

ping -c 3 "$TARGET" > /dev/null

echo "[TEST] Connectivity OK"
