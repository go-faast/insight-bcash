
FROM ubuntu:16.04
MAINTAINER Moe Adham <moe@faa.st>

# Install base dependencies
RUN apt-get update && apt-get install -y -q --no-install-recommends \
        apt-transport-https \
        build-essential \
        ca-certificates \
        curl \
        git \
        libssl-dev \
        python \
        rsync \
        software-properties-common \
        git-core \
        wget \
        libzmq3-dev \
        vim \
    && rm -rf /var/lib/apt/lists/*

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -yqq nodejs
RUN npm i -g npm@5


# Install Bitcore
RUN npm install --unsafe-perm -g satoshilabs/bitcore#261f8533c9d659c2c0f2eb82f3a6dc3147e26814
ADD bitcore-node.json /root/.bitcore/

# Patch insight ui

EXPOSE 3001 8333
ENTRYPOINT "bitcored"
