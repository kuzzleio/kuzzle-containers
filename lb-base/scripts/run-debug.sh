#!/bin/sh

echo "Starting Kuzzle Load balancer..."
pm2 start /config/processes.json

node ./plugins.js && pm2 sendSignal -s USR1 KuzzleLB

nohup node-inspector --web-port=8080 --debug-port=7003 > /dev/null 2>&1&

pm2 logs