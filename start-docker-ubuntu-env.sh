#!/bin/sh

# A utility script to start an interactive container for debugging purposes

IMAGE_NAME="ubuntu:latest"
CONTAINER_DIR=$(pwd)/container

mkdir -p ${CONTAINER_DIR}

sudo docker run -it -v ${CONTAINER_DIR}:/host:rw,slave ${IMAGE_NAME:="ubuntu:latest"} $@
