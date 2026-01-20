#!/usr/bin/env bash
set -euo pipefail

# Ensure root
if [[ $EUID -ne 0 ]]; then
  echo "❌ Please run as root (use sudo)"
  exit 1
fi

# Detect host default interface
HOST_IFACE=$(ip route | awk '/default/ {print $5}')
echo "[INFO] Using host interface: $HOST_IFACE"

# Enable IP forwarding
sysctl -w net.ipv4.ip_forward=1

# Flush old rules (lab-only cleanup)
iptables -t nat -D POSTROUTING -s 10.10.0.0/24 -o $HOST_IFACE -j MASQUERADE 2>/dev/null || true
iptables -t nat -D POSTROUTING -s 10.10.1.0/24 -o $HOST_IFACE -j MASQUERADE 2>/dev/null || true

# NAT for namespace
iptables -t nat -A POSTROUTING -s 10.10.0.0/24 -o $HOST_IFACE -j MASQUERADE

# NAT for Docker lab network
iptables -t nat -A POSTROUTING -s 10.10.1.0/24 -o $HOST_IFACE -j MASQUERADE

# Forwarding rules
iptables -A FORWARD -s 10.10.0.0/24 -j ACCEPT
iptables -A FORWARD -s 10.10.1.0/24 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

echo "[OK] NAT enabled for namespaces and Docker containers"

