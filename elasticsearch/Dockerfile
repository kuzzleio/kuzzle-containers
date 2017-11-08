FROM docker.elastic.co/elasticsearch/elasticsearch:5.4.1
MAINTAINER kuzzle <support@kuzzle.io>

COPY jvm.options /usr/share/elasticsearch/config/jvm.options

ENV ES_JAVA_OPTS="-Xms512m -Xmx512m"
ENV xpack.security.enabled=false
ENV xpack.monitoring.enabled=false
ENV xpack.graph.enabled=false
ENV xpack.watcher.enabled=false

