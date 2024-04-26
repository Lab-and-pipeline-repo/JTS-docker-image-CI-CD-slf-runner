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
    sudo usermod -aG docker $USER

    # Force logout and login for the current user
    echo "User added to the docker group. Logging out and logging in again..."
    exec su - $USER
fi

echo "User successfully logged in again."
