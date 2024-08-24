# Some new requirements have come up to install and configure some packages on the Nautilus infrastructure under Stratos Datacenter. The Nautilus DevOps team installed and configured a new Jenkins server so they wanted to create a Jenkins job to automate this task. Find below more details and complete the task accordingly:

# 1. Access the Jenkins UI by clicking on the Jenkins button in the top bar. Log in using the credentials: username admin and password Adm!n321.
# 2. Create a new Jenkins job named install-packages and configure it with the following specifications:

# Add a string parameter named PACKAGE.
# Configure the job to install a package specified in the $PACKAGE parameter on the storage server within the Stratos Datacenter.\

Login to the Jenkins UI
========================
#Install SSH plugins
Jenkins -> Manage Jenkins -> Manage Plugins -> SSH plugins (ssh, ssh credentials, ssh-build-agents).

#Create SSH credentials in Jenkins
Jenkins -> Manage Jenkins -> Manage Credentials ->
Username: natasha
Password: Bl@kW

#Add SSH Hosts in Jenkins
Jenkins -> Manage Jenkins -> Configure System
Under SSH Remote Hosts click Add Host and provide the following values:

Hostname: ststor01.stratos.xfusioncorp.com
Port: 22
Credentials: Choose natasha from the list

Click Check Connection to make sure connection is successful

#Create the Build Job
Create a new Jenkins job named "install-packages".
Check the box next to "This project is parameterized".
Add parameter -> String parameter -> Name the parameter "PACKAGE" and provide a default value if desired -> Save.
Under Build -> Build Step -> Execute shell script on remote host using SSH -> select natasha@ststor01.stratos.xfusioncorp.com:22

echo 'Bl@kW' | sudo -S yum install -y $PACKAGE

Save and Run the build.