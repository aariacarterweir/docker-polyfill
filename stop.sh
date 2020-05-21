#!/bin/sh

# Load config
. config.sh

docker container stop "$CONTAINER_NAME"
docker rm "$CONTAINER_NAME"
