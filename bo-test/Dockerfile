FROM kuzzleio/bo-base:alpine
MAINTAINER Kuzzle <support@kuzzle.io>

ADD /scripts /
RUN set -ex && \
    apk add -U \
        curl \
        git && \
    chmod 755 /*.sh && \
    curl -Ls https://github.com/kuzzleio/kuzzle-containers/releases/download/dockerized-phantomjs-2.1.1/dockerized-phantomjs.tar.gz \
        | tar xz -C / && \
    
    echo "done"

CMD ["/run-test.sh"]
