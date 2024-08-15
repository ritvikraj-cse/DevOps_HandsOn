# In the daily standup, it was noted that the timezone settings across the Nautilus Application Servers in the Stratos Datacenter are inconsistent with the local datacenter's timezone, currently set to Pacific/Enderbury.

# Synchronize the timezone settings to match the local datacenter's timezone (Pacific/Enderbury).

ssh user@ip
sudo timedatectl set-timezone Pacific/Enderbury
timedatectl
