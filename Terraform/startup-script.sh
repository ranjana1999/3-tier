#!/bin/bash

# Update package lists and install Docker
sudo apt-get update
sudo apt-get install -y docker.io

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Authenticate Docker with Artifact Registry
gcloud auth configure-docker

# Pull Docker image from Artifact Registry
sudo docker pull us-central1-docker.pkg.dev/my-project-57732-v/three-tier/frontend:latest

# Run Docker container
sudo docker run -d -p 80:80 us-central1-docker.pkg.dev/my-project-57732-v/three-tier/frontend:latest
