#!/bin/sh

npm install

# TODO: find a better way to wait for RabbitMQ
sleep 3
kuzzle perf