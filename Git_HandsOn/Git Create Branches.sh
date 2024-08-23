# Nautilus developers are actively working on one of the project repositories, /usr/src/kodekloudrepos/media. Recently, they decided to implement some new features in the application, and they want to maintain those new changes in a separate branch. Below are the requirements that have been shared with the DevOps team:

# On Storage server in Stratos DC create a new branch xfusioncorp_media from master branch in /usr/src/kodekloudrepos/media git repo.

cd /usr/src/kodekloudrepos/media
git checkout master
git checkout -b xfusioncorp_media
OR, 
git checkout -b xfusioncorp_media master