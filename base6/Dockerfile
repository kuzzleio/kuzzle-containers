FROM debian:stretch-slim

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

ENV NODE_VERSION=6.14.2
ENV PATH=/opt/node-v$NODE_VERSION-linux-x64/bin:$PATH

ADD https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz /tmp/

RUN  set -x \
  \
  && tar xf /tmp/node-v$NODE_VERSION-linux-x64.tar.gz -C /opt/ \
  && rm /tmp/node-v$NODE_VERSION-linux-x64.tar.gz \
  && mkdir -p /var/app \
  && npm install -g npm@5.6.0 \
  && npm set progress=false
