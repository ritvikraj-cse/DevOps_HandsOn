# The devops team of xFusionCorp Industries is working on to setup centralised logging management system to maintain and analyse server logs easily. Since it will take some time to implement, they wanted to gather some server logs on a regular basis. At least one of the app servers is having issues with the Apache server. The team needs Apache logs so that they can identify and troubleshoot the issues easily if they arise. So they decided to create a Jenkins job to collect logs from the server. Please create/configure a Jenkins job as per details mentioned below:

# 1. Create a Jenkins jobs named copy-logs.
# 2. Configure it to periodically build every 7 minutes to copy the Apache logs (both access_log and error_logs) from App Server 1 (from default logs location) to location /usr/src/devops on Storage Server.

Login to the Jenkins UI
========================
#Install SSH plugins
Jenkins -> Manage Jenkins -> Manage Plugins -> SSH plugins (ssh, ssh credentials, ssh-build-agents).

#Create SSH credentials in Jenkins
Jenkins -> Manage Jenkins -> Manage Credentials -> Add Credentials for appserver1 and storage server.

#Add SSH Hosts in Jenkins
Jenkins -> Manage Jenkins -> Configure System
Under SSH Remote Hosts click Add Host -> Add Both appserver1 and storage server.

#Create the Build Job
Create a new Jenkins job named "copy-logs".
Under Build -> Build Step -> Execute shell script on remote host using SSH -> select natasha@ststor01.stratos.xfusioncorp.com:22

select tony@stapp01.stratos.xfusioncorp.com:22

echo Ir0nM@n | sudo -S yum install sshpass -y
echo Ir0nM@n | sudo -S sshpass -p Bl@kW scp -o StrictHostKeyChecking=no -r /etc/httpd/logs/access_log natasha@ststor01:/usr/src/devops/
echo Ir0nM@n | sudo -S sshpass -p Bl@kW scp -o StrictHostKeyChecking=no -r /etc/httpd/logs/error_log natasha@ststor01:/usr/src/devops/



