# The Nautilus DevOps team possesses confidential data on App Server 3 in the Stratos Datacenter. A container named ubuntu_latest is running on the same server.

# Copy an encrypted file /tmp/nautilus.txt.gpg from the docker host to the ubuntu_latest container located at /tmp/. Ensure the file is not modified during this operation.

docker ps
docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/tmp/nautilus.txt.gpg
docker exec ubuntu_latest ls -l /tmp/
docker exec ubuntu_latest cat /tmp/nautilus.txt.gpg

