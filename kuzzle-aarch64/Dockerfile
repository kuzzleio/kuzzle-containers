FROM kuzzleio/aarch64:latest

ARG current_tag=master

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"
LABEL description="Run your Kuzzle backend in production mode"

ENV NODE_VERSION 8.11.3
ENV NODE_ENV=production

WORKDIR /var/app

# node js - taken from official dockerfile
RUN set -x \
  \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    python \
    xz-utils \
  \
  \
  && ARCH= && dpkgArch="$(dpkg --print-architecture)" \
  && case "${dpkgArch##*-}" in \
    amd64) ARCH='x64';; \
    ppc64el) ARCH='ppc64le';; \
    s390x) ARCH='s390x';; \
    arm64) ARCH='arm64';; \
    armhf) ARCH='armv7l';; \
    i386) ARCH='x86';; \
    *) echo "unsupported architecture"; exit 1 ;; \
  esac \
  && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
  && tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
  && rm "node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs
  \
  \
  && git clone -b ${current_tag} --recursive https://github.com/kuzzleio/kuzzle.git . \
  && npm install --unsafe-perm \
  && for plugin in plugins/enabled/*/; do \
      cd $plugin; \
      npm install --unsafe-perm; \  
     done
  \
  && apt-get remove \
    build-essentials \
    git \
    python \
    xz-utils \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*


ENTRYPOINT ["/var/app/docker-compose/scripts/docker-entrypoint.sh"]

CMD ["kuzzle", "start"]
