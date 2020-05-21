# Extend latest alpine image
FROM alpine:latest

# update and add packages
RUN apk update
RUN apk add --no-cache \
    bash \
    nodejs \
    npm

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

# clone repo
RUN git clone -b "$POLYFILL_TAG" --single-branch --depth 1 "https://github.com/Financial-Times/polyfill-service.git" .

# Install npm packages
RUN npm install --unsafe-perm
RUN export PATH="$(npm bin):${PATH}"

# Build
RUN npm run build

# Apk clean up
RUN apk del build

# Expose port
EXPOSE ${PORT}

# Set entry point
ENTRYPOINT ["npm", "run", "start"]

# Uncomment to debug
#CMD tail -f /dev/null
