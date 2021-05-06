FROM docker.elastic.co/elasticsearch/elasticsearch-oss:7.10.2

MAINTAINER kuzzle <support@kuzzle.io>

COPY jvm.options /usr/share/elasticsearch/config/jvm.options

ENV ES_JAVA_OPTS="-Xms512m -Xmx512m"

ENV cluster.name=kuzzle
ENV node.name=alyx
ENV discovery.type=single-node
