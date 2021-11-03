ARG TAG=14-alpine

FROM node:$TAG

WORKDIR /app

# Install packages
RUN set -eux; \
    # Packages to install
    apk add --no-cache \
        git \
    && \
    # Clean out directories that don't need to be part of the image
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && \
    npm install -g yo \
    && \
    mkdir -p /root/.config/configstore \
    && \
    chmod -R g+rwx /root /root/.config /root/.config/configstore

CMD ["yo"]
