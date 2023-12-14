#!/bin/bash
if [ `whoami` != root ]; then
    echo "Please run this script as root or using sudo"
    exit 1
fi

# Docker Compose install
NEW_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
mda="/usr/bin/docker-compose"

if command -v docker-compose &> /dev/null; then
    echo "Docker Compose is already installed."
    CURRENT_COMPOSE_VERSION=$(docker-compose -v | awk 'NR==1{print $4}')
    if [ "$CURRENT_COMPOSE_VERSION" = "$NEW_COMPOSE_VERSION" ]; then
        echo "The installed version ($CURRENT_COMPOSE_VERSION) is already the latest version."
    else
        echo "The installed version ($CURRENT_COMPOSE_VERSION). Updating to version $NEW_COMPOSE_VERSION."
        # Installing the new version
        curl -L "https://github.com/docker/compose/releases/download/${NEW_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose
        # Updating the symlink
        if [ ! -L $mda ]; then
            echo "=> Symlink does not exist"
            echo "=> Creating Symlink"
            ln -s /usr/local/bin/docker-compose $mda
        else
            echo "=> Symlink already exists"
        fi
        echo "Docker Compose has been successfully updated."
        docker-compose -v
    fi
else
    echo "Docker Compose is not installed. Installing version $NEW_COMPOSE_VERSION."
    # Installing the new version
    curl -L "https://github.com/docker/compose/releases/download/${NEW_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    # Creating the symlink
    if [ ! -L $mda ]; then
        echo "=> Symlink does not exist"
        echo "=> Creating Symlink"
        ln -s /usr/local/bin/docker-compose $mda
    else
        echo "=> Symlink already exists"
    fi
    echo "Docker Compose has been successfully installed."
    docker-compose -v
fi
