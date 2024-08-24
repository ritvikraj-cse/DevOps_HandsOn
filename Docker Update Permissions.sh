# One of the Nautilus project developers need access to run docker commands on App Server 1. This user is already created on the server. Accomplish this task as per details given below:

# User jim is not able to run docker commands on App Server 1 in Stratos DC, make the required changes so that this user can run docker commands without sudo.

ssh user@<App_Server_1_IP>

sudo usermod -aG docker jim #Add user jim to the docker group
groups jim #Verify that jim is now part of the docker group
OR, 
sudo setfacl -m u:jim:rw /var/run/docker.sock