
---

## 3️⃣ Automation Script – commands.sh

Place this in the same folder (`lab-01-secure-ssh/commands.sh`):

```bash
#!/bin/bash
# Lab 1 – Secure SSH Access Automation

echo "=== Lab 1 Automation Started ==="

# 1️⃣ Create cloudadmin user (if not exists)
if ! id -u cloudadmin >/dev/null 2>&1; then
    sudo adduser --gecos "" cloudadmin
    echo "cloudadmin created"
else
    echo "cloudadmin already exists"
fi

# 2️⃣ Add cloudadmin to sudo group
sudo usermod -aG sudo cloudadmin
echo "cloudadmin added to sudo group"

# 3️⃣ Ensure .ssh exists and set permissions
sudo -u cloudadmin mkdir -p /home/cloudadmin/.ssh
sudo -u cloudadmin chmod 700 /home/cloudadmin/.ssh

# 4️⃣ Copy host SSH key (if exists)
if [ -f ~/.ssh/id_ed25519.pub ]; then
    sudo -u cloudadmin sh -c 'cat ~/.ssh/id_ed25519.pub >> /home/cloudadmin/.ssh/authorized_keys'
    sudo -u cloudadmin chmod 600 /home/cloudadmin/.ssh/authorized_keys
    echo "SSH key copied for cloudadmin"
fi

# 5️⃣ Harden SSH by overriding cloud-init if present
echo "PermitRootLogin no
PasswordAuthentication no
AllowUsers cloudadmin" | sudo tee /etc/ssh/sshd_config.d/99-lab1-hardening.conf

# 6️⃣ Restart SSH
sudo systemctl restart sshd
echo "SSH restarted with hardening applied"

# 7️⃣ Verification
echo "=== Verification ==="
sshd -T | grep -E 'permitrootlogin|passwordauthentication|allowusers'

# 8️⃣ Success message
echo "=== Lab 1 Automation Completed ==="
echo "Verify SSH key login by opening a new terminal and running:"
echo "ssh cloudadmin@<SERVER_IP>"
