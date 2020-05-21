# Extend the latest ubuntu image
FROM alpine:latest

# Update / Upgrade apk
RUN apk update

# Install apk packages
RUN apk add \
    nodejs \
    npm \
    yarn \
    git

# Clone repo
RUN git clone -b v4.32.2 --single-branch --depth 1 "https://github.com/Financial-Times/polyfill-service.git" /app/

# Set a working directory
WORKDIR /app

# Chmod
RUN chmod -R 755 /app/

# Set env
ENV NODE_OPTIONS "--max-old-space-size=4112"
ENV NODE_ENV prod

# Install packages
RUN yarn import
RUN yarn
RUN yarn add grunt-cli

# GRUNT IT UP
RUN yarn run build

# Expose Ports
EXPOSE 3000

# Clean up
RUN rm /var/cache/apk/*

# Set entrypoint to "sh"
ENTRYPOINT ["sh"]
