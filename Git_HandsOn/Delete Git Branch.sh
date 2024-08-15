# The Nautilus developers are engaged in active development on one of the project repositories located at /usr/src/kodekloudrepos/apps. During testing, several test branches were created, and now they require cleanup. Here are the requirements provided to the DevOps team:

# On the Storage server in Stratos DC, delete a branch named xfusioncorp_apps from the /usr/src/kodekloudrepos/apps Git repository.

ssh natasha@172.16.238.15
cd /usr/src/kodekloudrepos/apps/
git config --global --add safe.directory /usr/src/kodekloudrepos/apps
git branch
sudo git checkout master
git branch
sudo git branch -d xfusioncorp_apps
