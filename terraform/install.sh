#!/bin/bash
# Installation script - runs on server startup

# Update system
yum update -y

# Install Docker
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install Git
yum install git -y

# Clone your repository
cd /home/ec2-user
git clone https://github.com/SurajK-555/crud-test.git app
cd app

# Start Docker containers
docker-compose -f docker-compose-simple.yml up -d

# Print status
echo "✅ App is running!"
echo "Frontend: http://localhost:3000"
echo "Backend API: http://localhost:8000/docs"
