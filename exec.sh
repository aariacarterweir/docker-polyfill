#!/bin/sh

# Load config
. config.sh

# open shell
docker exec -it "$CONTAINER_NAME" sh
