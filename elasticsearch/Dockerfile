FROM alpine:3.3
MAINTAINER Kuzzle <support@kuzzle.io>

RUN apk add -U \
        openjdk8;
    curl -L https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.2.0/elasticsearch-2.2.0.tar.gz -o /root/elasticsearch.tar.gz; \
    tar xvf elasticsearch.tar.gz -c /opt/elasticsearch
