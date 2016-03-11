FROM alpine:3.3
MAINTAINER Kuzzle <support@kuzzle.io>

RUN set -ex && \
    apk add -U \
        curl \
        erlang \
        erlang-crypto \
        erlang-eldap \
        erlang-inets \
        erlang-mnesia \
        erlang-os-mon \
        erlang-sasl \
        erlang-ssl \
        erlang-syntax-tools \
        erlang-xmerl \
        tar \
        xz && \
    mkdir -p /opt && \
    curl -Ls "https://www.rabbitmq.com/releases/rabbitmq-server/v3.6.1/rabbitmq-server-generic-unix-3.6.1.tar.xz" \
        | tar xJ -C /opt/ && \
    mv /opt/rabbit* /opt/rabbitmq && \
    mkdir -p /usr/local/sbin && \
    ln -s /opt/rabbitmq/sbin/* /usr/local/sbin/ && \
    apk del \
        tar \
        xz && \
    for plugin in stomp mqtt; do \
        rabbitmq-plugins enable rabbitmq_$plugin; \
    done && \
    echo "done"

COPY standard.config /opt/rabbitmq/etc/rabbitmq/
COPY ssl.config /opt/rabbitmq/etc/rabbitmq/
COPY wrapper.sh /

ENTRYPOINT ["/wrapper.sh"]

EXPOSE 4369 5671 5672 25672 61613 61614 1883 8883



