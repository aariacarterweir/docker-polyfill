#!/bin/sh

# Load config
. util/load-config.sh

echo 'stopping:'
docker container stop "$CONTAINER_NAME"
echo 'removing:'
docker rm "$CONTAINER_NAME"
