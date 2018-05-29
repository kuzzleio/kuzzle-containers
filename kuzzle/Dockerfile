#####################
# Development image #
#####################

FROM debian:stretch-slim as development

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

ENV NODE_VERSION=8.9.0
ENV PATH=/opt/node-v$NODE_VERSION-linux-x64/bin:$PATH

ADD https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz /tmp/

RUN  set -x \
  \
  && apt-get update && apt-get install -y \
       bash-completion \
       build-essential \
       curl \
       g++ \
       gdb \
       git \
       python \
       libfontconfig \
       rbenv \
       wget \
  && gem install \
     sass --version 3.2.10 \
  && tar xf /tmp/node-v$NODE_VERSION-linux-x64.tar.gz -C /opt/ \
  && rm /tmp/node-v$NODE_VERSION-linux-x64.tar.gz \
  && mkdir -p /var/app \
  && npm install -g npm \
  && npm set progress=false \
  && npm install -g \
    pm2@2.5.0 \
  && echo "" > /opt/node-v$NODE_VERSION-linux-x64/lib/node_modules/pm2/lib/keymetrics \
  && rm -rf /var/lib/apt/lists/* \
  && echo "alias ll=\"ls -lahF --color\"" >> ~/.bashrc

RUN  git clone --depth 1 https://github.com/kuzzleio/kuzzle /var/app \
  && git clone --depth 1 https://github.com/kuzzleio/kuzzle-plugin-auth-passport-local /var/app/plugins/available/kuzzle-plugin-auth-passport-local \
  && git clone --depth 1 https://github.com/kuzzleio/kuzzle-plugin-logger /var/app/plugins/available/kuzzle-plugin-logger

WORKDIR /var/app

RUN  npm install --unsafe \
  && npm rebuild all --unsafe \
  && for plugin in plugins/enabled/*; do cd "$plugin"; npm install --unsafe; cd /var/app; done

####################
# Production image #
####################

FROM debian:stretch-slim as production

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

ENV NODE_VERSION=8.9.0
ENV PATH=/opt/node-v$NODE_VERSION-linux-x64/bin:$PATH

COPY --from=development /var/app /var/app
COPY --from=development /opt/node-v$NODE_VERSION-linux-x64 /opt/node-v$NODE_VERSION-linux-x64

RUN  ln -s /var/app/docker-compose/scripts/run.sh /usr/local/bin/kuzzle \
  && chmod a+x /usr/local/bin/kuzzle \
  && chmod a+x /var/app/docker-compose/scripts/docker-entrypoint.sh

ENTRYPOINT ["/var/app/docker-compose/scripts/docker-entrypoint.sh"]

CMD ["kuzzle", "start"]
