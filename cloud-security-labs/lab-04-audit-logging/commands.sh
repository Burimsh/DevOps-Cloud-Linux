#!/bin/bash
# Lab 4 – Linux Audit & Authentication Logging

echo "=== Lab 4: Audit & Auth Logging ==="

# 1️⃣ Install auditd if not installed
sudo apt update
sudo apt install -y auditd audispd-plugins

# 2️⃣ Enable and start auditd
sudo systemctl enable auditd
sudo systemctl start auditd

# 3️⃣ Copy audit rules for monitoring SSH, sudo, and authentication
sudo cp audit.rules /etc/audit/rules.d/audit.rules

# 4️⃣ Restart auditd to apply rules
sudo systemctl restart auditd

# 5️⃣ Show auditd status
echo "=== AuditD Status ==="
sudo systemctl status auditd --no-pager

# 6️⃣ List active audit rules
echo "=== Current Audit Rules ==="
sudo auditctl -l

# 7️⃣ Show last 10 auth log events
echo "=== Last 10 auth.log Events ==="
sudo journalctl _COMM=sshd -n 10 --no-pager

echo "=== Lab 4 Completed Successfully ==="
