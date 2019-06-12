FROM debian:stretch-slim

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"
LABEL description="Enhance the Kuzzle core with ease"

WORKDIR /var/app
ENV TERM=xterm
ENV NODE_6_VERSION=6.17.1
ENV NODE_8_VERSION=8.11.3
ENV NODE_10_VERSION=10.16.0

RUN set -x \
 \
 && apt-get update \
 && apt-get install -y \
      bash-completion \
      build-essential \
      curl \
      g++ \
      gdb \
      git \
      gnupg \
      libfontconfig \
      libzmq3-dev \
      python \
      procps \
      wget \
  && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs \
  \
  && npm install -g n \
  \
  && n $NODE_6_VERSION \
  && npm install -g pm2 \
  \
  && n $NODE_8_VERSION \
  && npm install -g pm2 \
  \
  && n $NODE_10_VERSION \
  && npm install -g pm2 \
  \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && echo "alias ll=\"ls -lahF --color\"" >> ~/.bashrc \
  && chmod +x ~/.bashrc \
  \
  && n $NODE_8_VERSION
