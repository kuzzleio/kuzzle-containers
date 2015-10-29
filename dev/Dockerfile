FROM kuzzleio/base
MAINTAINER Kuzzle <support@kuzzle.io>

ONBUILD RUN apt-get update && apt-get install -y \
    wget

ONBUILD RUN npm install -g \
    grunt-cli@0.1.13 \
    node-inspector@0.12.3

ADD /scripts /
ADD /config/ /config/
RUN chmod 755 /*.sh

EXPOSE 7512

CMD ["/run.sh"]
