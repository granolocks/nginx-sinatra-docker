#!/bin/bash
IMAGE_NAME=nginx-sinatra
./build-container.sh $IMAGE_NAME

# docker run -it --rm $IMAGE_NAME:latest /bin/bash
docker run -it --rm $IMAGE_NAME:latest
