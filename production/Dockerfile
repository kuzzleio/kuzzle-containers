FROM kuzzleio/development as development

FROM debian:stretch-slim as production

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"
LABEL description="Run your Kuzzle backend in production mode"

ENV NODE_VERSION=8.9.0
ENV NODE_ENV=production
ENV PATH=/opt/node-v$NODE_VERSION-linux-x64/bin:$PATH

COPY --from=development /var/app /var/app
COPY --from=development /opt/node-v$NODE_VERSION-linux-x64 /opt/node-v$NODE_VERSION-linux-x64

RUN  ln -s /var/app/docker-compose/scripts/run.sh /usr/local/bin/kuzzle \
  && chmod a+x /usr/local/bin/kuzzle \
  && chmod a+x /var/app/docker-compose/scripts/docker-entrypoint.sh

ENTRYPOINT ["/var/app/docker-compose/scripts/docker-entrypoint.sh"]

CMD ["kuzzle", "start"]
