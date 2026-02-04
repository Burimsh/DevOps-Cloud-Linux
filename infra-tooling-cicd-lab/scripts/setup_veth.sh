#!/bin/bash
set -euo pipefail

VETH_A=veth-a
VETH_B=veth-b
IP_A=10.0.0.1/24
IP_B=10.0.0.2/24

echo "[SETUP] Creating veth pair"

ip link add "$VETH_A" type veth peer name "$VETH_B" || true

ip addr add "$IP_A" dev "$VETH_A" || true
ip addr add "$IP_B" dev "$VETH_B" || true

ip link set "$VETH_A" up
ip link set "$VETH_B" up

echo "[SETUP] veth pair ready"
