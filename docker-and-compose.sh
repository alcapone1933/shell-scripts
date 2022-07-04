#!/bin/bash
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
mda=/usr/bin/docker-compose
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo sh -c "curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose
if [ ! -L $mda ]; then
    sudo echo "=> Symlink  doesn't exist"
    sudo echo "=> Create Symlink" 
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose 
else
    sudo echo "=> Symlink exist"
fi
sudo docker-compose -v
