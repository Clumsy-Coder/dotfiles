#!/bin/bash

# credit: https://github.com/victoriadrake/dotfiles/

which docker &> /dev/null
if [ $? -eq 0 ]; then
  sudo apt remove docker docker-engine docker.io containerd runc
fi

# https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
echo "🐋 Installing Docker"
sudo apt update
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo docker run hello-world