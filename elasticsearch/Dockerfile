FROM docker.elastic.co/elasticsearch/elasticsearch:7.4.0

MAINTAINER kuzzle <support@kuzzle.io>

COPY jvm.options /usr/share/elasticsearch/config/jvm.options

ENV ES_JAVA_OPTS="-Xms512m -Xmx512m"

ENV xpack.security.enabled=false
ENV xpack.monitoring.enabled=false
ENV xpack.graph.enabled=false
ENV xpack.watcher.enabled=false

ENV cluster.name=kuzzle
ENV node.name=alyx
ENV discovery.type=single-node
