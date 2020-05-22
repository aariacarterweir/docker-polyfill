#!/bin/sh

# Load config
. util/load-config.sh

# update from git repo
git pull origin master

# get latest docker image
docker pull "$IMAGE_NAME"
