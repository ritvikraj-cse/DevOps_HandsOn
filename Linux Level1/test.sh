# As part of the temporary resource allocation, John has been appointed to the Nautilus project as a backup developer. To facilitate this, a temporary user account is required for John. It is advisable to create a user account with a specified expiration date to ensure restricted server access beyond the designated period.

# A user profile under the name john has already been established on App Server 2 within the Stratos Datacenter. Adjust the account's expiration date to 2024-02-17. Additionally, locate all files (excluding directories) owned by this user within the /home/usersdata directory and copy them to the /news directory while maintaining their original ownership.

sudo chage -E 2024-02-17 john
sudo find /home/usersdata -type f -user john -exec cp --preserve=ownership {} /news/ \;



# After conducting comprehensive security audits on its servers, xFusionCorp Industries security team has instituted several new security measures. Among these measures is the discontinuation of direct root login through SSH.

# Disable direct SSH root login across all application servers located in the Stratos Datacenter.

sudo vi /etc/ssh/sshd_config
#modify
PermitRootLogin no
sudo systemctl restart sshd



# There is a cron job that needs to be added to the Nautilus storage server in Stratos DC.The cron details is as below:

# a. Install cronie package and start crond service.
# b. Add this command to the crontab of root user:

# /usr/bin/touch test_passed
# Make it run every day at 21:30 (use 30 21 format in the expression).

sudo yum install cronie   # For Red Hat/CentOS-based systems
Or sudo apt-get install cron  # For Debian/Ubuntu-based systems
sudo systemctl start crond
sudo systemctl enable crond
sudo crontab -e  #Add the Cron Job
30 21 * * * /usr/bin/touch test_passed #Run the command /usr/bin/touch test_passed every day at 21:30:
sudo crontab -l



# The Nautilus security team performed an audit on all servers present in Stratos DC. During the audit some critical data/files were identified which were having the wrong permissions as per security standards. Once the report was shared with the production support team, they started fixing the issues one by one. It has been identified that one of the files named /etc/resolv.conf on Nautilus App 2 server has wrong permissions, so that needs to be fixed and the correct ACLs needs to be applied.

# a. User virat must not have any permission on this file.

# b. User vivek should have read only permission on this file. Further, dbadmin group should have read/write permissions on this file.

sudo chmod u-rwx /etc/resolv.conf #Remove all permissions for user virat.
OR, sudo setfacl -m u:virat:--- /etc/resolv.conf
sudo setfacl -m u:vivek:r-- /etc/resolv.conf #Set read-only permission for user vivek.
sudo chmod g+rw /etc/resolv.conf #Set read-write permission for group dbadmin.
sudo getfacl /etc/resolv.conf #Verify the permissions and ACLs.



# The development team requires specific logs stored within the Nautilus storage server situated in the Stratos DC. Access the designated location on the server to retrieve the necessary logs. Further, perform below actions:

# Create a tar archive named logs.tar (under natasha's home) of /var/log/ directory.
# Now, create a compressed tar archive as well named logs.tar.gz (under natasha's home) of /var/log/ directory.

sudo tar -cvf /home/natasha/logs.tar /var/log/ #Create tar archive (uncompressed).
sudo tar -czvf /home/natasha/logs.tar.gz /var/log/ #Create compressed tar archive (gzip).



# There is some data on Nautilus App Server 2 in Stratos DC. Data needs to be altered in some of the files. On Nautilus App Server 2, alter the /home/BSD.txt file as per details given below.

# a. Delete all lines containing the word code and save the results in /home/BSD_DELETE.txt file. (Please be aware of case sensitivity)
# b. Replace all occurrences of the word and (look for the exact match) with their and save the results in /home/BSD_REPLACE.txt file.

# Note: Let's say you are asked to replace the word to with from. In that case, make sure not to alter any words containing the string itself, for example; upto, contributor etc.

sudo sed -i '/code/d' /home/BSD.txt && sudo cp /home/BSD.txt /home/BSD_DELETE.txt
sudo sed -i 's/\band\b/their/g' /home/BSD.txt && sudo cp /home/BSD.txt /home/BSD_REPLACE.txt 



# Some new requirements have been shared by the Nautilus application development team, a new package need to be installed on all app servers in Stratos Datacenter.

# Install the bind package on all app servers in Stratos Datacenter and start/enable its service.

ssh user@ip
sudo yum install bind -y
sudo systemctl start named #Start bind
sudo systemctl enable named 



# The Nautilus system admins team recently deployed a web UI application for their backup utility running on the Nautilus backup server in Stratos Datacenter. The application is running on port 5004. They have a firewalld installed on that server. The requirements that have come up include the following:

# Open all incoming connections on 5004/tcp port, zone should be public.

sudo firewall-cmd --zone=public --add-port=5004/tcp --permanent
sudo firewall-cmd --reload



# On our Storage server in Stratos Datacenter we are having some issues where the nfsuser user is holding hundreds of processes, which is degrading the performance of the server. Therefore, we have a requirement to limit its maximum processes. Please set its maximum process limits as below:

# a. soft limit = 1026
# b. hard_limit = 2027

sudo vi /etc/security/limits.conf
#Add the following lines at the end of the file:
nfsuser soft nproc 1026
nfsuser hard nproc 2027