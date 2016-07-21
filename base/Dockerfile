FROM mhart/alpine-node:4.4
MAINTAINER Kuzzle <support@kuzzle.io>

RUN set -ex && \
    apk add -U \
        nmap \
        curl \
        python && \
    npm install -g \
        pm2 \
        grunt-cli@0.1.13 && \
    apk del --purge \
        python && \
    mkdir -p /var/app

WORKDIR /var/app

RUN npm set progress=false

ADD /profile/profile /etc/profile
ADD /profile/bash /bin/
ADD /scripts /
ADD /config/ /config/
RUN chmod 755 /*.sh

CMD ["/run.sh"]
