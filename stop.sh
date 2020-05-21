#!/bin/sh

# Load config
. config.sh

echo 'stopping:'
docker container stop "$CONTAINER_NAME"
echo 'removing:'
docker rm "$CONTAINER_NAME"
