FROM debian:stretch-slim

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"
LABEL description="Enhance the Kuzzle core with ease"

WORKDIR /var/app
ENV TERM=xterm
ENV NODE_12_16_3=12.16.3
ENV NODE_12_18_1=12.18.1
ENV NODE_14_VERSION=14.17.0

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
  && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get install -y nodejs \
  \
  && npm install -g n \
  \
  && n $NODE_12_16_3 \
  && n $NODE_12_18_1 \
  && n $NODE_14_VERSION \
  && npm install -g nodemon kourou \
  \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && echo "alias ll=\"ls -lahF --color\"" >> ~/.bashrc \
  && chmod +x ~/.bashrc \
  \
  && n $NODE_14_VERSION
