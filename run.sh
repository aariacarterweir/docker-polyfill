#!/bin/sh

# Load config
. util/load-config.sh

# docker run command
docker run \
  --detach \
  --name "$CONTAINER_NAME" \
  -p "$LOCAL_PORT":"$CONTAINER_PORT" \
  "$IMAGE_NAME"
