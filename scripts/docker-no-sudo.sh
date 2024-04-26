#!/bin/bash

# Check if the docker group exists
if grep -q '^docker:' /etc/group; then
    echo "Docker group already exists."
else
    # If not, create the docker group
    sudo groupadd docker
    echo "Docker group created."
fi

# Check if the user is already in the docker group
if groups $USER | grep &>/dev/null '\bdocker\b'; then
    echo "User is already in the docker group."
else
    # If not, add the user to the docker group
    sudo gpasswd -a $USER docker

    # Refresh group membership without logging out
    exec sg docker newgrp

    echo "User added to the docker group."
fi
