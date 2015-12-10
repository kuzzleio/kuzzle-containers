#!/bin/sh

echo "Starting Kuzzle BO..."
pm2 start /config/processes.json

nohup node-inspector --web-port=8080 --debug-port=7002 > /dev/null 2>&1&
pm2 sendSignal -s USR1 KuzzleBo

pm2 logs