#!/bin/bash
# Lab 3 – Fail2Ban SSH Protection

echo "=== Lab 3: Fail2Ban SSH Brute-Force Protection ==="

# 1️⃣ Install Fail2Ban
sudo apt update
sudo apt install -y fail2ban

# 2️⃣ Enable and start service
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# 3️⃣ Copy jail.local configuration
sudo cp jail.local /etc/fail2ban/jail.local

# 4️⃣ Restart Fail2Ban to apply rules
sudo systemctl restart fail2ban

# 5️⃣ Show Fail2Ban status
echo "=== Fail2Ban Service Status ==="
sudo systemctl status fail2ban --no-pager

# 6️⃣ Show SSH jail status
echo "=== SSH Jail Status ==="
sudo fail2ban-client status sshd

echo "=== Lab 3 Completed Successfully ==="
