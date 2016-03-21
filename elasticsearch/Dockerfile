FROM alpine:3.3
MAINTAINER Kuzzle <support@kuzzle.io>

COPY docker-entrypoint.sh /

RUN set -ex && \
    apk add -U \
        curl \
        openjdk8 && \
    mkdir -p /opt && \
    curl -Ls https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.2.0/elasticsearch-2.2.0.tar.gz \
    | tar xz -C /opt/ && \
    mv /opt/elasticsearch* /opt/elasticsearch && \
    ln -s /opt/elasticsearch/bin/elasticsearch /usr/local/bin/ && \
    mkdir -p /opt/elasticsearch/plugins && \
    adduser -D -H es && \
    cd /opt/elasticsearch && \
    for path in \
        ./data \
        ./logs \
        ./config \
        ./config/scripts \
        ; do \
            mkdir -p "$path"; \
            chown -R es:es "$path"; \
        done && \
    apk del curl && \
    echo "done"

COPY config /opt/elasticsearch/config

EXPOSE 9200 9300
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]
