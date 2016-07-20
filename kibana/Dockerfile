FROM alpine:3.3
MAINTAINER Kuzzle <support@kuzzle.io>

ENV KIBANA_VERSION 4.5.0
ENV ELASTICSEARCH_HOST elasticsearch

RUN set -ex \
    && apk add -U \
        curl \
        ca-certificates \
        nodejs \
    && mkdir -p /opt \
    && curl -o /tmp/kibana-$KIBANA_VERSION-linux-x64.tar.gz https://download.elastic.co/kibana/kibana/kibana-$KIBANA_VERSION-linux-x64.tar.gz \
    && tar -xvzf /tmp/kibana-$KIBANA_VERSION-linux-x64.tar.gz -C /opt/ \
    && sed -i 's|^# elasticsearch.url: "http://localhost:9200"|elasticsearch.url: "http://elasticsearch:9200"|' /opt/kibana-$KIBANA_VERSION-linux-x64/config/kibana.yml \
    && rm -rf /tmp/*.tar.gz /var/cache/apk/* /opt/kibana-$KIBANA_VERSION-linux-x64/node/ \
    && ln -s /opt/kibana-$KIBANA_VERSION-linux-x64/bin/kibana /opt/kibana \
    && mkdir -p /opt/kibana-$KIBANA_VERSION-linux-x64/node/bin/ \
    && chmod 755 /opt/kibana \
    && ln -s $(which node) /opt/kibana-$KIBANA_VERSION-linux-x64/node/bin/node \
    && apk del curl

RUN /opt/kibana plugin -i elastic/timelion

EXPOSE 5601

ADD /scripts/run.sh /run.sh

CMD ["ash", "/run.sh"]
