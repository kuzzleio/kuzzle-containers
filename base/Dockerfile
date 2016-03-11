FROM alpine:3.3
MAINTAINER Kuzzle <support@kuzzle.io>

ENV TERM=xterm-color

RUN set -ex && \
    apk add -U \
        nmap \
        nodejs \
        python && \
    npm install -g \
        pm2 \
        grunt-cli@0.1.13 && \
    apk del --purge \
        python && \
    mkdir -p /var/app

WORKDIR /var/app

ADD /scripts /
ADD /config/ /config/
RUN chmod 755 /*.sh

CMD ["ash"]
