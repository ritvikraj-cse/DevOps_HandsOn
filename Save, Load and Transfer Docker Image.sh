# One of the DevOps team members was working on to create a new custom docker image on App Server 1 in Stratos DC. He is done with his changes and image is saved on same server with name official:nautilus. Recently a requirement has been raised by a team to use that image for testing, but the team wants to test the same on App Server 3. So we need to provide them that image on App Server 3 in Stratos DC.

# a. On App Server 1 save the image official:nautilus in an archive.
# b. Transfer the image archive to App Server 3.
# c. Load that image archive on App Server 3 with same name and tag which was used on App Server 1.

ssh tony@172.16.238.10 
docker images
docker save -o /tmp/nautilus.tar official:nautilus
scp /tmp/nautilus.tar banner@172.16.238.12:/tmp/
ssh banner@172.16.238.12
docker load -i /tmp/nautilus.tar
docker images
