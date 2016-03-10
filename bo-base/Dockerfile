FROM kuzzleio/base
MAINTAINER Kuzzle <support@kuzzle.io>

RUN apk add -U \
        build-base \
        python && \
    npm install -g \
        grunt-cli@0.1.13 \
        node-inspector@0.12.3 \
        bower@1.6.5 \
        pm2 && \
    apk add -U \
        ruby \
        ruby-rdoc \
        ruby-irb && \
    gem install sass --version 3.2.10 && \
    apk del \
        build-base \
        python

ADD /scripts /
ADD /config/ /config/
RUN chmod 755 /*.sh

EXPOSE 3000

CMD ["/run.sh"]
