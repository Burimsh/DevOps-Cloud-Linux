#!/bin/bash
terraform apply -target=module.spoke -auto-approve
echo "[OK] Spoke deployed"
