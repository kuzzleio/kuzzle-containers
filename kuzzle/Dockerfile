ARG current_tag=latest

FROM kuzzleio/plugin-dev:$current_tag as plugin-dev

FROM debian:stretch-slim as kuzzle

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"
LABEL description="Run your Kuzzle backend in production mode"

ENV NODE_VERSION=8.9.0
ENV NODE_ENV=production
ENV PATH=/opt/node-v$NODE_VERSION-linux-x64/bin:$PATH

COPY --from=plugin-dev /var/app /var/app
COPY --from=plugin-dev /opt/node-v$NODE_VERSION-linux-x64 /opt/node-v$NODE_VERSION-linux-x64

RUN  ln -s /var/app/docker-compose/scripts/run.sh /usr/local/bin/kuzzle \
  && chmod a+x /usr/local/bin/kuzzle \
  && chmod a+x /var/app/docker-compose/scripts/docker-entrypoint.sh

WORKDIR /var/app

ENTRYPOINT ["/var/app/docker-compose/scripts/docker-entrypoint.sh"]

CMD ["kuzzle", "start"]
