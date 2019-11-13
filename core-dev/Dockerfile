FROM debian:stretch-slim

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"
LABEL description="Enhance the Kuzzle core with ease"

WORKDIR /var/app
ENV TERM=xterm
ENV NODE_12_VERSION=12.13.0

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
  && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get install -y nodejs \
  \
  && npm install -g n \
  \
  && n $NODE_12_VERSION \
  && npm install -g pm2 \
  \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && echo "alias ll=\"ls -lahF --color\"" >> ~/.bashrc \
  && chmod +x ~/.bashrc \
  \
  && n $NODE_12_VERSION
