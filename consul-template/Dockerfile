FROM alpine:3.6
MAINTAINER Kuzzle <support@kuzzle.io>
WORKDIR /tmp/consul-template
RUN  apk update \
  && apk --no-cache add \
    curl \
    zip \
  && curl -SLO https://releases.hashicorp.com/consul-template/0.10.0/consul-template_0.10.0_linux_amd64.zip \
  && unzip consul-template_0.10.0_linux_amd64.zip \
  && chmod a+x consul-template

FROM alpine:3.6
MAINTAINER Kuzzle <support@kuzzle.io>
WORKDIR /tmp/docker
RUN  apk update \
  && apk --no-cache add \
    curl \
  && curl -SLO https://download.docker.com/linux/static/stable/x86_64/docker-17.09.0-ce.tgz \
  && tar -xvf docker-17.09.0-ce.tgz

FROM scratch
MAINTAINER Kuzzle <support@kuzzle.io>
WORKDIR /root/
COPY --from=0 /tmp/consul-template/consul-template /usr/local/bin/consul-template
COPY --from=1 /tmp/docker/docker/docker /usr/local/bin/docker
COPY --from=1 /etc/ca-certificates* /etc/

ENTRYPOINT [ "consul-template" ]
CMD [ "--help" ]


