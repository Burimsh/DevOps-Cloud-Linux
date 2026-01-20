#!/usr/bin/env bash
set -euo pipefail

# Ensure running as root
if [[ $EUID -ne 0 ]]; then
  echo "❌ Please run as root (use sudo)"
  exit 1
fi

CONTAINER_NAME="web"
NETWORK_NAME="docker-lab-net"
CONTAINER_IP="10.10.1.10"

# Remove existing container if present
if docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
  echo "[INFO] Removing existing container: ${CONTAINER_NAME}"
  docker rm -f ${CONTAINER_NAME}
fi

# Run container
docker run -d \
  --name ${CONTAINER_NAME} \
  --network ${NETWORK_NAME} \
  --ip ${CONTAINER_IP} \
  nginx:latest

echo "[OK] Nginx container started on ${CONTAINER_IP} in ${NETWORK_NAME}"

