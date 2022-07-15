#!/bin/bash
if [ `whoami` != root ]; then
    echo Please run this script as root or using sudo
    exit 1
fi
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
docker-compose -v
