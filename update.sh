#!/bin/sh

. config.sh

git pull origin master
docker pull "$IMAGE_NAME"
