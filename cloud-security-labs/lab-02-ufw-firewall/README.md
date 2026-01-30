# Lab 2 – UFW Firewall (Cloud VM Security)

## Objective
Secure an Ubuntu Server by enforcing firewall rules using UFW (Uncomplicated Firewall).

## Security Controls Applied
- Default deny for all incoming traffic
- Allow all outgoing traffic
- Allow SSH access to prevent lockout
- Firewall enabled at boot

## Commands Used
```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable
