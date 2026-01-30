# Lab 3 – Fail2Ban (SSH Brute-Force Protection)

## Objective
Protect SSH access by automatically blocking IPs that attempt repeated failed logins.

## Why This Matters
SSH is the most common attack vector on cloud VMs.
Fail2Ban adds an automated protection layer on top of SSH hardening and firewall rules.

## Security Controls Implemented
- Monitors SSH authentication logs
- Detects brute-force login attempts
- Automatically bans offending IPs
- Integrates with systemd and firewall

## Configuration Highlights
- Max retries: 5
- Detection window: 10 minutes
- Ban duration: 15 minutes

## Commands Used
```bash
sudo fail2ban-client status
sudo fail2ban-client status sshd
