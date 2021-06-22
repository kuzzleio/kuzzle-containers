FROM resin/armv7hf-debian:stretch

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"
LABEL description="Core development stack"

ENV NODE_14_VERSION=14.17.0
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
    procps \
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
  && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_14_VERSION/node-v$NODE_14_VERSION-linux-$ARCH.tar.xz" \
  && tar -xJf "node-v$NODE_14_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
  && rm "node-v$NODE_14_VERSION-linux-$ARCH.tar.xz" \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  \
  && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash \
  && export NVM_DIR="$HOME/.nvm" \
  && . "$NVM_DIR/nvm.sh" \
  \
  && nvm install $NODE_14_VERSION \
  && nvm use $NODE_14_VERSION  \
  && npm install -g --unsafe-perm nodemon \
  \
  && nvm use $NODE_14_VERSION

RUN [ "cross-build-end" ]

CMD [ "/bin/bash" ]
