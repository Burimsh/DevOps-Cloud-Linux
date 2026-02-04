#!/bin/bash
set -euo pipefail

echo "[CI] Running connectivity tests"

bash scripts/setup_veth.sh
bash scripts/test_connectivity.sh

echo "[CI] Tests passed"
