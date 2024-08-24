# The Nautilus DevOps team aims to containerize various applications following a recent meeting with the application development team. They intend to conduct testing with the following steps:

# Install docker-ce and docker compose packages on App Server 3.

# Initiate the docker service.

sudo yum update -y
# Install prerequisite packages
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
# Add the Docker repository
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce # Install Docker CE
# Download Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# Apply executable permissions to Docker Compose
sudo chmod +x /usr/local/bin/docker-compose
sudo systemctl start docker
sudo systemctl enable docker # Enable Docker to start on boot
sudo systemctl status docker