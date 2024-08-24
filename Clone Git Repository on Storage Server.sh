# The DevOps team established a new Git repository last week, which remains unused at present. However, the Nautilus application development team now requires a copy of this repository on the Storage Server in the Stratos DC. Follow the provided details to clone the repository:

# The repository to be cloned is located at /opt/demo.git

# Clone this Git repository to the /usr/src/kodekloudrepos directory. Ensure no modifications are made to the repository during the cloning process.

ssh user@ip
cd /usr/src/kodekloudrepos
sudo git clone /opt/demo.git
ls -la /usr/src/kodekloudrepos/demo

# This will clone the repository in a "bare" format, meaning it will only contain the repository data (.git directory) without a working tree.
sudo git clone --bare /opt/demo.git /usr/src/kodekloudrepos/demo.git
or
# The --mirror option is similar to --bare, but it also includes all remote-tracking branches and refs (such as tags), making it an exact copy of the source repository.
sudo git clone --mirror /opt/demo.git /usr/src/kodekloudrepos/demo.git

