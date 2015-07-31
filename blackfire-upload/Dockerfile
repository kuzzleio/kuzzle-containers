FROM debian:wheezy
MAINTAINER Kuzzle <support@kuzzle.io>

RUN echo "deb http://packages.blackfire.io/debian any main" > /etc/apt/sources.list.d/blackfire.list

RUN apt-get update && apt-get install -y --force-yes \
    curl \
    vim \
    build-essential \
    sudo \
    wget \
    blackfire-agent && \
    apt-get clean

ADD /scripts/aggregate.sh aggregate.sh
ADD /scripts/upload.sh upload.sh

RUN chmod 755 *.sh

CMD ./upload.sh