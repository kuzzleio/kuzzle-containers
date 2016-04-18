FROM alpine:3.3
MAINTAINER Kuzzle <support@kuzzle.io>

ENV TERM=xterm-color ENV=/etc/profile NODE_VERSION=4.4.3

ADD https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz /root/

RUN mkdir /opt && \
    gunzip /root/node-v$NODE_VERSION-linux-x64.tar.gz && \
    tar xvf /root/node-v$NODE_VERSION-linux-x64.tar -C /opt/ && \
    rm /root/node-v$NODE_VERSION-linux-x64.tar

ENV PATH=/opt/node-v$NODE_VERSION-linux-x64/bin:$PATH

RUN set -ex && \
    apk add -U \
        nmap \
        python && \
    npm install -g \
        pm2 \
        grunt-cli@0.1.13 && \
    apk del --purge \
        python && \
    mkdir -p /var/app

WORKDIR /var/app

ADD /profile/profile /etc/profile
ADD /profile/bash /bin/
ADD /scripts /
ADD /config/ /config/
RUN chmod 755 /*.sh

CMD ["ash"]
