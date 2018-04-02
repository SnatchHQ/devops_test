FROM debian:stretch

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive
ENV NGINX_VERSION 1.13.10-1~stretch

# Install Basic Requirements
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -q -y gnupg2 dirmngr wget apt-transport-https lsb-release ca-certificates \
    # Changed MIT PGP server for the cluster/ring for improved availability
    && apt-key adv --keyserver hkp://pool.sks-keyservers.net:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
    && echo "deb http://nginx.org/packages/mainline/debian/ stretch nginx" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -q -y \
        apt-utils \
        # Need envsubst which is part of gettext
        gettext \
        curl \
        nano \
        zip \
        unzip \
        python-pip \
        python-setuptools \
        git \
        nginx=${NGINX_VERSION} \
    && pip install wheel \
    && pip install supervisor supervisor-stdout \
    && echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d \
    && rm -rf /etc/nginx/conf.d/default.conf \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Supervisor config
COPY supervisord.conf /etc/supervisord.conf

# Override nginx's default config
COPY default.conf /etc/nginx/default-source.conf

# Add Scripts
COPY start.sh /start.sh
