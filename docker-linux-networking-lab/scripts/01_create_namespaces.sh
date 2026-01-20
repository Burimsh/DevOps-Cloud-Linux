#!/usr/bin/env bash
set -euo pipefail

# Ensure running as root
if [[ $EUID -ne 0 ]]; then
  echo "❌ Please run as root (use sudo)"
  exit 1
fi

# Create network namespaces
for ns in ns-client ns-router ns-server; do
  ip netns add $ns 2>/dev/null || echo "[INFO] Namespace $ns already exists"
  echo "[OK] Namespace $ns created"
done

