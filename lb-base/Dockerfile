FROM kuzzleio/base:alpine
MAINTAINER Kuzzle <support@kuzzle.io>

RUN set -ex && \
    apk add \
      build-base \
      git \
      python && \
    apk del --purge \
      build-base

WORKDIR /var/app

ADD /scripts /
ADD /config/ /config/
RUN chmod 755 /*.sh

CMD ["/run.sh"]
