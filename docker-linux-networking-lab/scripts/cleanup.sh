#!/usr/bin/env bash
set -euo pipefail

# Ensure running as root
if [[ $EUID -ne 0 ]]; then
  echo "❌ Please run as root (use sudo)"
  exit 1
fi

echo "[INFO] Cleaning up lab..."

# Delete namespaces
for ns in ns-client ns-router ns-server; do
  ip netns del $ns 2>/dev/null || true
done

# Delete veth interfaces
ip link del veth-br 2>/dev/null || true

# Delete bridge
ip link set br-lab down 2>/dev/null || true
ip link del br-lab 2>/dev/null || true

# Remove Docker container and network
docker rm -f web 2>/dev/null || true
docker network rm docker-lab-net 2>/dev/null || true

# Reset iptables
iptables -F
iptables -t nat -F
sysctl -w net.ipv4.ip_forward=0

echo "[OK] Lab reset complete"

