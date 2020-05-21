#!/bin/sh

# Load config
. config.sh

docker container stop "$CONTAINER_NAME"
docker system prune --force
