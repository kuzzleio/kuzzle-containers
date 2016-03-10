FROM kuzzleio/base
MAINTAINER Kuzzle <support@kuzzle.io>

RUN apk add -U \
        python && \
    npm install -g \
    pm2 \
    grunt-cli@0.1.13 \
    node-inspector@0.12.3 && \
    apk del --purge \
        python

ADD /scripts /
ADD /config/ /config/
RUN chmod 755 /*.sh

EXPOSE 7512

CMD ["/run.sh"]
