FROM kuzzleio/base
MAINTAINER Kuzzle <support@kuzzle.io>

RUN npm install -g \
    pm2@1.1.1 \
    grunt-cli@0.1.13 \
    node-inspector@0.12.3

ADD /scripts /
ADD /config/ /config/
RUN chmod 755 /*.sh

EXPOSE 7512

ENV PATH=/var/app/bin:$PATH

CMD ["/run.sh"]
