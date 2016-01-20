FROM kuzzleio/bo-base
MAINTAINER Kuzzle <support@kuzzle.io>

ADD /scripts /
RUN chmod 755 /*.sh

RUN apt-get update -y
RUN apt-get install -y libfreetype6-dev libfontconfig1-dev

RUN npm install -g phantomjs

CMD ["/run-test.sh"]