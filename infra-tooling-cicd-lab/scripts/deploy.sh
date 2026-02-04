#!/bin/bash
set -euo pipefail

ENV_FILE=$1

if [[ -z "${ENV_FILE:-}" ]]; then
  echo "Usage: deploy.sh <environment file>"
  exit 1
fi

source "$ENV_FILE"

echo "[DEPLOY] Environment: $ENV"
echo "[DEPLOY] Subnet: $VETH_SUBNET"

bash scripts/setup_veth.sh
bash scripts/test_connectivity.sh

echo "[DEPLOY] Deployment to $ENV successful"
