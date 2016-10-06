FROM debian:jessie
MAINTAINER Kuzzle <support@kuzzle.io>

ENV NODE_VERSION=4.5.0

ADD https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz /root/
RUN tar xf /root/node-v$NODE_VERSION-linux-x64.tar.gz -C /opt/ && \
    rm /root/node-v$NODE_VERSION-linux-x64.tar.gz

ENV PATH=/opt/node-v$NODE_VERSION-linux-x64/bin:$PATH

RUN apt-get update && apt-get install -y \
      build-essential \
      curl \
      g++ \
      git \
      python \
      wget && \
    npm set progress=false && \
    npm install -g \
      pm2 && \
    apt-get clean

RUN mkdir -p /var/app

WORKDIR /var/app

CMD ["/run.sh"]
