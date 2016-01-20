FROM kuzzleio/bo-base
MAINTAINER Kuzzle <support@kuzzle.io>

ADD /scripts /
RUN chmod 755 /*.sh

RUN npm install -g phantomjs

CMD ["/run-test.sh"]