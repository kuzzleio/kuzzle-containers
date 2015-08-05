#!/bin/sh

npm install --dev

# TODO: find a better way to wait for RabbitMQ
sleep 3
pm2 start /config/processes-dev.json
pm2 logs