# Following security audits, the xFusionCorp Industries security team has rolled out new protocols, including the restriction of direct root SSH login.
# Your task is to disable direct SSH root login on all app servers within the Stratos Datacenter.

ssh user@ip

sudo vi /etc/ssh/sshd_config

Modify- PermitRootLogin no

:wq!

sudo systemctl restart sshd