#!/usr/bin/env bash

dockerize -n -o /tmp/dockerized-phantomjs \
          -e $(which phantomjs) \
          -a /bin/dash /bin/sh \
          -a /etc/fonts /etc  \
          -a /etc/ssl /etc  \
          -a /usr/share/fonts /usr/share  \
          --verbose \
          $(which phantomjs) \
          /usr/bin/curl

cd /tmp/dockerized-phantomjs
tar -czf /dockerized-phantomjs/dockerize-phantomjs.tar.gz ./*
