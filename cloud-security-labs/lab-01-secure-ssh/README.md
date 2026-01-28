# Lab 1 – Secure SSH Access (Cloud VM Hardening)

## Objective
Secure SSH access on an Ubuntu Server VM using cloud security best practices.

## Steps
- Created dedicated admin user (`cloudadmin`)
- Enforced SSH key-based authentication
- Disabled root login
- Disabled password authentication
- Restricted SSH access to a single user

## Verification
```bash
whoami
sudo whoami
sshd -T | grep -E 'permitrootlogin|passwordauthentication|allowusers'
