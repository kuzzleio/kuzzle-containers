FROM kuzzleio/base
MAINTAINER Kuzzle <support@kuzzle.io>

#ONBUILD RUN apt-get update && apt-get install -y \
#    wget

RUN npm install -g \
    pm2 \
    grunt-cli@0.1.13 \
    node-inspector@0.12.3

ADD /scripts /
ADD /config/ /config/
RUN chmod 755 /*.sh

# Pre-install Kuzzle dependencies
ONBUILD RUN git clone https://github.com/kuzzleio/kuzzle.git . && npm install

EXPOSE 7512

CMD ["/run.sh"]
