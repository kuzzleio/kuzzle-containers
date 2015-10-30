FROM kuzzleio/base
MAINTAINER Kuzzle <support@kuzzle.io>

ONBUILD RUN apt-get update && apt-get install -y \
    wget

ONBUILD RUN npm install -g \
    grunt-cli@0.1.13 \
    node-inspector@0.12.3

ADD /scripts /
ADD /config/ /config/
RUN chmod 755 /*.sh

# Pre-install Kuzzle dependencies
ENV PATH /opt/node-v$NODE_VERSION-linux-x64/bin:$PATH
WORKDIR /var/app
ONBUILD RUN  curl -L https://raw.githubusercontent.com/kuzzleio/kuzzle/master/package.json > /var/app/package.json && \
    npm install

EXPOSE 7512

CMD ["/run.sh"]
