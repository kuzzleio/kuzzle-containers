FROM kuzzleio/base
MAINTAINER Kuzzle <support@kuzzle.io>

RUN npm install -g \
    grunt-cli@0.1.13 \
    node-inspector@0.9.2

ADD /scripts /
ADD /config/ /config/
RUN chmod 755 /*.sh

EXPOSE 7512

CMD ["/run.sh"]
