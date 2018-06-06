FROM debian:stretch-slim as development

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"
LABEL description="Develop new plugin or protocol for Kuzzle with ease"

ENV NODE_VERSION=8.9.0
ENV PATH=/opt/node-v$NODE_VERSION-linux-x64/bin:$PATH

ADD https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz /tmp/

RUN  set -x \
  \
  && apt-get update && apt-get install -y \
       bash-completion \
       build-essential \
       curl \
       g++ \
       gdb \
       git \
       python \
       libfontconfig \
       wget \
  && tar xf /tmp/node-v$NODE_VERSION-linux-x64.tar.gz -C /opt/ \
  && rm /tmp/node-v$NODE_VERSION-linux-x64.tar.gz \
  && mkdir -p /var/app \
  && npm install -g npm \
  && npm set progress=false \
  && npm install -g \
    pm2 \
  && echo "" > /opt/node-v$NODE_VERSION-linux-x64/lib/node_modules/pm2/lib/keymetrics \
  && rm -rf /var/lib/apt/lists/* \
  && echo "alias ll=\"ls -lahF --color\"" >> ~/.bashrc

RUN  git clone --depth 1 https://github.com/kuzzleio/kuzzle /var/app \
  && git clone --depth 1 https://github.com/kuzzleio/kuzzle-plugin-auth-passport-local /var/app/plugins/available/kuzzle-plugin-auth-passport-local \
  && git clone --depth 1 https://github.com/kuzzleio/kuzzle-plugin-logger /var/app/plugins/available/kuzzle-plugin-logger

WORKDIR /var/app

RUN  npm install --unsafe \
  && npm rebuild all --unsafe \
  && for plugin in plugins/enabled/*; do cd "$plugin"; npm install --unsafe; cd /var/app; done
