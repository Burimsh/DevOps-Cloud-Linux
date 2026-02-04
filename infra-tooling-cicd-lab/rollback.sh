#!/bin/bash
set -euo pipefail

PREVIOUS_TAG=$(git tag --sort=-creatordate | sed -n '2p')

if [[ -z "${PREVIOUS_TAG:-}" ]]; then
  echo "[ROLLBACK] No previous version available"
  exit 1
fi

echo "[ROLLBACK] Reverting to $PREVIOUS_TAG"

git checkout "$PREVIOUS_TAG"
bash scripts/deploy.sh environments/prod.env

