#!/bin/bash
# Update the installed packages
sudo apt update && sudo apt upgrade -y

#Install necessary dependencies
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#Update package index to include Docker packages
sudo apt update

#Install Docker Engine, CLI, and container runtime
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Start the Docker service
sudo systemctl start docker

# Enable Docker to start on boot
sudo systemctl enable docker

# Add ubuntu to the docker group so you can run docker commands without sudo
sudo usermod -aG docker ubuntu

# Install Docker Compose plugin   
sudo apt update
sudo apt  install docker-compose

mkdir /home/ubuntu/sonarqube

docker-compose up -d