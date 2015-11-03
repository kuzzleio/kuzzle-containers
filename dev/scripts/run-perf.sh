#!/bin/sh

# TODO: find a better way to wait for RabbitMQ
sleep 3
pm2 start app-perf.js ${PM2_OPTIONS}
pm2 logs
