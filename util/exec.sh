#!/bin/sh

# Load config
. util/load-config.sh

# open shell
docker exec -it "$CONTAINER_NAME" sh
