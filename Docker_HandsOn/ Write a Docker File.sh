# As per recent requirements shared by the Nautilus application development team, they need custom images created for one of their projects. Several of the initial testing requirements are already been shared with DevOps team. Therefore, create a docker file /opt/docker/Dockerfile (please keep D capital of Dockerfile) on App server 1 in Stratos DC and configure to build an image with the following requirements:

# a. Use ubuntu as the base image.
# b. Install apache2 and configure it to work on 3002 port. (do not update any other Apache configuration settings like document root etc).

sudo vi Dockerfile


FROM ubuntu:latest
RUN apt-get update && apt-get install -y apache2
EXPOSE 3002
# Change the default Apache port from 80 to 3002
RUN sed -i 's/Listen 80/Listen 3002/' /etc/apache2/ports.conf
# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

