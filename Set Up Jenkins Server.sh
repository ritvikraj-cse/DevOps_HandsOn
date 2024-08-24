# The DevOps team at xFusionCorp Industries is initiating the setup of CI/CD pipelines and has decided to utilize Jenkins as their server. Execute the task according to the provided requirements:

# 1. Install jenkins on jenkins server using yum utility only, and start its service. You might face timeout issue while starting the Jenkins service, please refer this link for help.
# 2. Jenkin's admin user name should be theadmin, password should be Adm!n321, full name should be Javed and email should be javed@jenkins.stratos.xfusioncorp.com.

# Note:
# 1. For this task, access the Jenkins server by SSH using the root user and password S3curePass from the jump host.
# 2. After Jenkins server installation, click the Jenkins button on the top bar to access the Jenkins UI and follow on-screen instructions to create an admin user.

ssh root@jenkins

yum install wget -y

wget -O /etc/yum.repos.d/jenkins.repo \                  #Download Jenkins repo and configure it
> https://pkg.jenkins.io/redhat-stable/jenkins.repo

ls -l /etc/yum.repos.d/

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

yum install jenkins

systemctl daemon-reload 

systemctl start jenkins

yum install java-17-openjdk

systemctl start jenkins

systemctl status jenkins

cat /var/lib/jenkins/secrets/initialAdminPassword




