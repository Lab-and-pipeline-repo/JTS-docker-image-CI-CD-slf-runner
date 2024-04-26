#!/bin/bash
echo "List of container images"
echo "======================"
docker  ps -a
echo " "
echo " "


# Start container database
echo "==Removing database container===="
docker stop tododb-container 
docker rm tododb-container

# Start container Backend
echo "==Removing backend container===="
docker stop todoback-container 
docker rm todoback-container


# Start container front
echo "==Removing frontend container===="
docker stop todofront-container
docker rm todofront-container 

echo " "
echo " "
echo "Containers killed successfully!and list is"
echo "======================"
docker ps -a

# Removing network bridge
echo "Removing bridge adapter  bridge-subas-script-172.30.0.0-sl-24"
docker network rm bridge-subas-script-172.30.0.0-sl-24