FROM debian:stretch-slim

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"
LABEL description="Enhance the Kuzzle core with ease"

WORKDIR /var/app
ENV TERM=xterm
ENV NODE_6_VERSION=6.17.1
ENV NODE_8_VERSION=8.11.3
ENV NODE_10_VERSION=10.15.0

RUN  apt-get update && apt-get install -y \
        curl \
        gnupg \
  && curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN set -x \
 \
 && apt-get install -y \
      bash-completion \
      build-essential \
      g++ \
      gdb \
      git \
      libfontconfig \
      libzmq3-dev \
      python \
      procps \
      wget \
      nodejs \
  && npm install -g n \
  \
  && n $NODE_8_VERSION \
  && npm install -g \
    pm2 \
  \
  && n $NODE_6_VERSION \
  && npm install -g \
    pm2 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && echo "alias ll=\"ls -lahF --color\"" >> ~/.bashrc \
  && chmod +x ~/.bashrc

RUN n $NODE_8_VERSION
