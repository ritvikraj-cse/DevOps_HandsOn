# The Nautilus application development team has been working on a project repository /opt/apps.git. This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC. They recently shared the following requirements with DevOps team:

# Create a new branch datacenter in /usr/src/kodekloudrepos/apps repo from master and copy the /tmp/index.html file (present on storage server itself) into the repo. Further, add/commit this file in the new branch and merge back that branch into master branch. Finally, push the changes to the origin for both of the branches.

ssh natasha@ip
cd /usr/src/kodekloudrepos

git checkout master
git pull origin master
git checkout -b datacenter #Create a new branch datacenter from master

cp /tmp/index.html /usr/src/kodekloudrepos/

git add index.html
git commit -m "Add index.html file for datacenter"

git checkout master
git pull origin master
git merge datacenter

git push origin master
git push origin datacenter





