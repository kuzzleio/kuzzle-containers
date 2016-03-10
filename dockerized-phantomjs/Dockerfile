FROM debian:jessie
MAINTAINER Kuzzle <support@kuzzle.io>

RUN echo "deb http://httpredir.debian.org/debian jessie contrib" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y \
        curl \
        libfontconfig \
        python-dev \
        python-pip \
        rsync \
        xfonts-base \
        ttf-mscorefonts-installer && \
    pip install -U dockerize\#0.2.2 && \
    curl -L "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2" -o phantomjs.tar.bz2 && \
    tar xvf phantomjs.tar.bz2 -C /opt && \
    ln -s /opt/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/ && \
    echo "done"

ADD dockerize.sh /tmp/dockerize.sh

CMD ["sh", "/tmp/dockerize.sh"]

