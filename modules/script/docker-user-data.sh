#!/bin/bash
# Update the installed packages
sudo yum update -y

# Install Docker
sudo yum install -y docker

# Start the Docker service
sudo systemctl start docker

# Enable Docker to start on boot
sudo systemctl enable docker

# Add ec2-user to the docker group so you can run docker commands without sudo
sudo usermod -aG docker ec2-user

