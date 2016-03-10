FROM kuzzleio/bo-base
MAINTAINER Kuzzle <support@kuzzle.io>

ADD /scripts /
RUN chmod 755 /*.sh && \
    curl -Ls https://github.com/kuzzleio/kuzzle-containers/releases/download/dockerized-phantomjs-2.1.1/dockerized-phantomjs.tar.gz \
    | tar xz -C /

CMD ["/run-test.sh"]
