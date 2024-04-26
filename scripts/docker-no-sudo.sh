#!/bin/bash

# Check if the user is already in the docker group
if groups $USER | grep &>/dev/null '\bdocker\b'; then
    echo "User is already in the docker group."
else
    # If not, add the user to the docker group
    sudo groupadd docker
    sudo gpasswd -a $USER docker
    newgrp docker
    echo "User added to the docker group."
fi
