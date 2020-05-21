# Extend latest alpine image
FROM alpine:latest

# update and add packages
RUN apk update
RUN apk add --no-cache \
    bash \
    nodejs \
    yarn

# add virtual packages
RUN apk add --no-cache --virtual \
    build \
    git \
    python \
    make \
    gcc \
    g++

# workdir
WORKDIR /polyfill

# set eng and args
ENV PORT 3000
ARG POLYFILL_TAG='v4.32.2'
ARG NODE_ENV='production'

# clone repo and clean up
RUN git clone -b "$POLYFILL_TAG" --single-branch --depth 1 "https://github.com/Financial-Times/polyfill-service.git" .
RUN rm -rf .git

# Import yarn packages
RUN yarn import

# Replace some stuff in start_server.sh
RUN sed -i.bak -e 's,^node,exec node,' start_server.sh

# Move the start_server script to the /bin dir
RUN	mv start_server.sh /bin/

# Permissions
RUN chmod a+x /bin/start_server.sh

# Apk clean up
RUN apk del build

# Expose port
EXPOSE ${PORT}

# spin up
CMD ["/bin/start_server.sh", "server/index.js"]

# Uncomment to debug
#CMD tail -f /dev/null
