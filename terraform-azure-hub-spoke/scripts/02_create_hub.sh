#!/bin/bash
terraform init
terraform apply -target=module.hub -auto-approve
echo "[OK] Hub deployed"
