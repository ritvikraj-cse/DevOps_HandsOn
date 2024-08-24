# The Nautilus development team has initiated a new project development, establishing various Git repositories to manage each project's source code. Recently, a repository named /opt/games.git was created. The team has provided a sample index.html file located on the jump host under the /tmp directory. This repository has been cloned to /usr/src/kodekloudrepos on the storage server in the Stratos DC.


# Copy the sample index.html file from the jump host to the storage server placing it within the cloned repository at /usr/src/kodekloudrepos/games.

# Add and commit the file to the repository.

# Push the changes to the master branch.

sudo scp /tmp/index.html user@storage_server:/tmp/

sudo ssh user@storage_server
sudo mv /tmp/index.html /usr/src/kodekloudrepos/beta/

cd /usr/src/kodekloudrepos/beta
sudo git add index.html
sudo git commit -m "Added index.html to the beta repository"
sudo git push origin master

