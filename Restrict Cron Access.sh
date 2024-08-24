# In alignment with security compliance standards, the Nautilus project team has opted to impose restrictions on crontab access. Specifically, only designated users will be permitted to create or update cron jobs.

# Configure crontab access on App Server 1 as follows: Allow crontab access to javed user while denying access to the rod user.

ssh user@ip

sudo vi  /etc/cron.deny
# Add the following line to the file
rod

sudo vi /etc/cron.allow
# Add the following line to the file
javed


Or, 
sudo crontab -e -u javed
sudo usermod -G cron.deny rod

