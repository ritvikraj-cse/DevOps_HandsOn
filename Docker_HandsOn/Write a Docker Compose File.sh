# The Nautilus application development team shared static website content that needs to be hosted on the httpd web server using a containerised platform. The team has shared details with the DevOps team, and we need to set up an environment according to those guidelines. Below are the details:

# a. On App Server 2 in Stratos DC create a container named httpd using a docker compose file /opt/docker/docker-compose.yml (please use the exact name for file).
# b. Use httpd (preferably latest tag) image for container and make sure container is named as httpd; you can use any name for service.
# c. Map 80 number port of container with port 8082 of docker host.
# d. Map container's /usr/local/apache2/htdocs volume with /opt/finance volume of docker host which is already there. (please do not modify any data within these locations).

cd /opt/docker/
sudo vi docker-compose.yml

version '3'
services:
  app:
    image: httpd:latest
    container_name: httpd
    ports:
      - "8082:80"
    volumes:
      - /opt/finance:/usr/local/apache2/htdocs

