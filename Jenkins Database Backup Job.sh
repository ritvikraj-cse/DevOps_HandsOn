# There is a requirement to create a Jenkins job to automate the database backup. Below you can find more details to accomplish this task:

# Create a Jenkins job named database-backup.
# Configure it to take a database dump of the kodekloud_db01 database present on the Database server in Stratos Datacenter, the database user is kodekloud_roy and password is asdfgdsd.
# The dump should be named in db_$(date +%F).sql format, where date +%F is the current date.
# Copy the db_$(date +%F).sql dump to the Backup Server under location /home/clint/db_backups.
# Further, schedule this job to run periodically at */10 * * * * (please use this exact schedule format).

Jenkins Server -> Db Server -> Backup Server.


Manage Plugins > Install SSH, SSH Credentials, SSH build-agents plugins.
Manage Jenkins > Configure System > Remote hosts > Hostname: stdb01.stratos.xfusioncorp.com, Port: 22, Credentials: peter 
create a new job name: database-backup.
build periodically > */10 * * * *

ssh user@db_server
ssh-keygen -t rsa
ssh-copy-id clint@backup_server

Build Steps > Execute shell script on remote host using ssh > peter@stdb01.stratos.xfusioncorp.com:22

    mysqldump -u kodekloud_roy -pasdfgdsd kodekloud_db01 > db_$(date +%F).sql
    scp -o StrictHostKeyChecking=no db_$(date +%F).sql clint@stbkp01:/home/clint/db_backups/

