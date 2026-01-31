## Audit Rules Configured

### Sudo Monitoring
-w /etc/sudoers -p wa -k sudo_changes
-w /etc/sudoers.d/ -p wa -k sudo_changes

### Authentication Logs
-w /var/log/auth.log -p wa -k authlog

### SSH Login Monitoring
-w /var/log/secure -p wa -k sshlog

> ⚠️ **Ubuntu Note**
> Ubuntu does not use `/var/log/secure` for SSH authentication events (this is RHEL/CentOS specific).
> SSH activity on Ubuntu is logged via PAM and `sshd`.  
> To properly audit SSH logins, this lab also monitors execution of `/usr/sbin/sshd`.

```md
### SSH Execution Auditing (Ubuntu)
-a always,exit -F path=/usr/sbin/sshd -F perm=x -F auid>=1000 -F auid!=unset -k ssh_exec

