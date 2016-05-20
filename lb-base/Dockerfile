FROM kuzzleio/base:alpine
MAINTAINER Kuzzle <support@kuzzle.io>

RUN set -ex && \
    apk add \
      build-base \
      git \
      python && \
    apk del --purge \
      build-base \
      python

ADD /scripts /
ADD /config/ /config/
RUN chmod 755 /*.sh

CMD ["/run.sh"]
