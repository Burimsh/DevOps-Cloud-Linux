#!/bin/bash
# Lab 2 – UFW Firewall Hardening

echo "=== Lab 2: UFW Firewall Configuration ==="

# 1️⃣ Ensure UFW is installed
if ! command -v ufw >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y ufw
fi

# 2️⃣ Set default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# 3️⃣ Allow SSH (important to avoid lockout)
sudo ufw allow ssh

# Optional: Allow SSH only from local network
# sudo ufw allow from 192.168.1.0/24 to any port 22

# 4️⃣ Enable UFW (force = no prompt)
sudo ufw --force enable

# 5️⃣ Show firewall status
echo "=== UFW Status ==="
sudo ufw status verbose

echo "=== Lab 2 Completed Successfully ==="
