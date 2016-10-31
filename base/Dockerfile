FROM debian:jessie
MAINTAINER Kuzzle <support@kuzzle.io>

ENV NODE_VERSION=6.9.1
ENV PATH=/opt/node-v$NODE_VERSION-linux-x64/bin:$PATH

ADD https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz /tmp/

RUN tar xf /tmp/node-v$NODE_VERSION-linux-x64.tar.gz -C /opt/ \
    && rm /tmp/node-v$NODE_VERSION-linux-x64.tar.gz \
    && mkdir -p /var/app \
    && npm set progress=false \
    && npm install -g \
      pm2@2.0.19 \
    && echo "" > /opt/node-v$NODE_VERSION-linux-x64/lib/node_modules/pm2/lib/keymetrics \
