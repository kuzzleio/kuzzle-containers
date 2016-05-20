#!/bin/sh

echo "Starting Kuzzle Load balancer..."
pm2 start /config/processes.json

node bin/plugins.js && pm2 sendSignal -s USR1 KuzzleLB

pm2 logs
