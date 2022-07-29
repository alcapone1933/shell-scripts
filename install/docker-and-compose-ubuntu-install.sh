#!/bin/bash
if [ `whoami` != root ]; then
    echo Please run this script as root or using sudo
    exit 1
fi
# Docker install
apt-get update
apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
docker -version 

# Docker Compose install
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
mda=/usr/bin/docker-compose
sh -c "curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
chmod +x /usr/local/bin/docker-compose
if [ ! -L $mda ]; then
    echo "=> Symlink  doesn't exist"
    echo "=> Create Symlink" 
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose 
else
    echo "=> Symlink exist"
fi
docker-compose -version