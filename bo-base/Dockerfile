FROM kuzzleio/base:alpine
MAINTAINER Kuzzle <support@kuzzle.io>

RUN apk add -U \
        build-base \
        python && \
    npm install -g \
        bower@1.6.5 && \
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
