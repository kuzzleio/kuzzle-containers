FROM kuzzleio/base
MAINTAINER Kuzzle <support@kuzzle.io>

RUN apt-get update && apt-get install -y \
    wget \
    rbenv

RUN npm install -g \
    grunt-cli@0.1.13 \
    node-inspector@0.12.3

RUN gem install sass --version 3.2.10

ADD /scripts /
ADD /config/ /config/
RUN chmod 755 /*.sh

EXPOSE 3000

CMD ["/run.sh"]
