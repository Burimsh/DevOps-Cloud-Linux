#!/usr/bin/env bash
set -euo pipefail

# Ensure running as root
if [[ $EUID -ne 0 ]]; then
  echo "❌ Please run as root (use sudo)"
  exit 1
fi

# Create bridge br-lab
ip link add name br-lab type bridge 2>/dev/null || echo "[INFO] Bridge br-lab already exists"
ip addr add 10.10.0.1/24 dev br-lab 2>/dev/null || true
ip link set br-lab up

echo "[OK] Bridge br-lab created and configured"

