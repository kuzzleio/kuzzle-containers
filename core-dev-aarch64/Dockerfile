FROM resin/aarch64-debian:stretch

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"
LABEL description="Core development stack"

ENV NODE_6_VERSION 6.13.1
ENV NODE_8_VERSION 8.11.3
ENV NODE_10_VERSION=10.15.0
ENV NODE_ENV=production

WORKDIR /var/app

RUN [ "cross-build-start" ]

# node js - taken from official dockerfile
RUN set -x \
  \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    libzmq3-dev \
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
  && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_8_VERSION/node-v$NODE_8_VERSION-linux-$ARCH.tar.xz" \
  && tar -xJf "node-v$NODE_8_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
  && rm "node-v$NODE_8_VERSION-linux-$ARCH.tar.xz" \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  \
  && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash \
  && export NVM_DIR="$HOME/.nvm" \
  && . "$NVM_DIR/nvm.sh" \
  \
  && nvm install $NODE_6_VERSION  \
  && nvm use $NODE_6_VERSION \
  && npm install -g --unsafe-perm \
    pm2 \
  && nvm install $NODE_8_VERSION \
  && nvm use $NODE_8_VERSION \
  && npm install -g --unsafe-perm \
    pm2


RUN [ "cross-build-end" ]

CMD [ "/bin/bash" ]
