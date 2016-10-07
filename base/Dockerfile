FROM debian:jessie
MAINTAINER Kuzzle <support@kuzzle.io>

ENV NODE_VERSION=4.5.0
ENV PATH=/opt/node-v$NODE_VERSION-linux-x64/bin:$PATH

ADD https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz /root/

RUN tar xf /root/node-v$NODE_VERSION-linux-x64.tar.gz -C /opt/ \
    && rm /root/node-v$NODE_VERSION-linux-x64.tar.gz \
    && mkdir -p /var/app \
    && npm set progress=false \
    && npm install -g \
      pm2 \
    && echo "" > /opt/node-v$NODE_VERSION-linux-x64/lib/node_modules/pm2/lib/keymetrics \

WORKDIR /var/app

CMD ["/run.sh"]
