# The Nautilus team wants to create a debug container on Application Server 1. However, they had some specific requirements related to the CMD. Please complete the task as per details given below:

# a. On Application Server 1 create a container named debug_1 using image ubuntu/apache2:latest.
# b. Overwrite the default CMD with command sleep 1000.
# c. Make sure the container is in running state.

ssh user@<Application_Server_1_IP>
sudo docker pull ubuntu/apache2:latest
sudo docker run -d --name debug_1 ubuntu/apache2:latest sleep 1000
sudo docker ps | grep debug_1



# The Nautilus DevOps team has some confidential data present on App Server 1 in Stratos Datacenter. There is a container ubuntu_latest running on the same server. We received a request to copy some of the data from the docker host to the container. Below are more details about the task:

# On App Server 1 in Stratos Datacenter copy an encrypted file /tmp/nautilus.txt.gpg from docker host to ubuntu_latest container (running on same server) in /opt/ location (create this location if doesn't exit). Please do not try to modify this file in any way.

docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/opt/nautilus.txt.gpg
docker exec -it ubuntu_latest cat /opt/nautilus.txt.gpg



# The DevOps team is performing some cleanup on all app servers in Stratos DC. They want to clean up some unwanted docker images from these servers, some images might be in use by some docker containers, but those containers are not in use so we need to clean those containers and the images. Below are the images that need to be deleted from Application Server 1:

# a. alpine:3.18.4
# b. sebp/lighttpd:latest

docker images
docker rmi alpine:3.18.4
docker rmi sebp/lighttpd:latest



# The Nautilus DevOps team wanted to transfer some docker images from one server to another server so they wanted to save some docker images as tar archives on the docker host itself. Find below the exact requirements:

# There is a docker image named nginx:mainline-alpine-slim on App Server 1 in Stratos Datacenter, save this image as nginx.tar archive under /home directory on the same server.

sudo docker save -o /home/nginx.tar nginx:mainline-alpine-slim



# The Nautilus DevOps team is planning to do some cleanup on App Server 1 in Stratos Datacenter, some old and unused docker networks need to be deleted. Find below more details:

# Delete a docker network named php-network from App Server 1 in Stratos Datacenter.

docker network rm -f php-network
docker network ls



# The Nautilus DevOps team is planning to setup/create some docker containers on App Server 1 in Stratos Datacenter, some prerequisites are needs to be done on this server. Find below more details:

# Create a new network named mysql-network using the bridge driver. Allocate subnet 182.18.0.0/24, configure Gateway 182.18.0.1.

docker network create --driver bridge --subnet 182.18.0.0/24 --gateway 182.18.0.1 mysql-network


# The Nautilus DevOps team is doing some cleanup work on all servers in Stratos DC. They were also looking for some unwanted and heavy docker images if present and can be cleaned.

# On App Server 3 in Stratos Datacenter look for the docker images with size more than 100MB, delete all such docker images.

docker stop 425dd760fd5f c5bf68373d58 0ac2666c213d
docker rm 425dd760fd5f c5bf68373d58 0ac2666c213d
docker images -a --format "{{.ID}} {{.Size}}" | awk '$2 > 100MB' | cut -d' ' -f1 | xargs -r docker rmi -f






