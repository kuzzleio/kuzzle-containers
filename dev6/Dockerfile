FROM debian:stretch-slim

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

ENV NODE_VERSION=6.9.0
ENV PATH=/opt/node-v$NODE_VERSION-linux-x64/bin:$PATH

ADD https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz /tmp/

RUN  set -x \
  \
  && tar xf /tmp/node-v$NODE_VERSION-linux-x64.tar.gz -C /opt/ \
  && rm /tmp/node-v$NODE_VERSION-linux-x64.tar.gz \
  && mkdir -p /var/app \
  && npm install -g npm@5.6.0 \
  && npm set progress=false

WORKDIR /var/app
ENV TERM=xterm

RUN set -x \
 \
 && apt-get update && apt-get install -y \
      bash-completion \
      build-essential \
      curl \
      g++ \
      gdb \
      git \
      libfontconfig \
      python \
      rbenv \
      wget \
  && gem install \
    sass --version 3.2.10 \
  && npm install -g \
    bower \
    pm2@2.5.0 \
  && echo "" > /opt/node-v$NODE_VERSION-linux-x64/lib/node_modules/pm2/lib/keymetrics \
  \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && echo "alias ll=\"ls -lahF --color\"" >> ~/.bashrc
