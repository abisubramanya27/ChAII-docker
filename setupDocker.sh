#!/bin/bash

# Install docker using convenience script
curl https://get.docker.com | sh 
sudo systemctl --now enable docker

# Setup NVIDIA container toolkit

## Setup the stable repository and GPG key
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

curl -s -L https://nvidia.github.io/nvidia-container-runtime/experimental/$distribution/nvidia-container-runtime.list | sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list

# Update and install nvidia-docker2
sudo apt-get update
sudo apt-get install nvidia-docker2

# Restart docker to apply changes
sudo systemctl restart docker

# All set!