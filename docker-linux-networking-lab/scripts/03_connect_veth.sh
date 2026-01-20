#!/usr/bin/env bash
set -euo pipefail

# Ensure running as root
if [[ $EUID -ne 0 ]]; then
  echo "❌ Please run as root (use sudo)"
  exit 1
fi

# Clean old veth interfaces
ip link del veth-br 2>/dev/null || true
ip netns exec ns-client ip link del veth-client 2>/dev/null || true

# Create veth pair
ip link add veth-client type veth peer name veth-br

# Move one end into namespace
ip link set veth-client netns ns-client

# Assign IP addresses
ip netns exec ns-client ip addr add 10.10.0.2/24 dev veth-client
ip netns exec ns-client ip link set veth-client up

ip link set veth-br master br-lab
ip link set veth-br up

# Add default route in the namespace
ip netns exec ns-client ip route add default via 10.10.0.1

# Add DNS servers in the namespace
ip netns exec ns-client bash -c "echo 'nameserver 8.8.8.8' > /etc/resolv.conf"
ip netns exec ns-client bash -c "echo 'nameserver 1.1.1.1' >> /etc/resolv.conf"

echo "[OK] Namespace connected to bridge, default route + DNS configured"

