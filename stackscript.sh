#!/bin/bash
fallocate -l 10G /swapfile && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile

apt-get update
apt-get install -y ca-certificates curl gnupg lsb-release htop mc screen

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

docker run --restart=always --name=db1000n --detach --pull=always ghcr.io/arriven/db1000n:latest
