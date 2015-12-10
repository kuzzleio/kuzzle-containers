#!/bin/sh

echo "Starting Kuzzle BO..."

pm2 start /config/processes.json

nohup node-inspector --web-port=8082 --debug-port=7002 > /dev/null 2>&1&
pm2 sendSignal -s USR1 KuzzleBo

grunt sass
bower install
grunt watch &

pm2 logs