#!/bin/sh

echo "Starting Kuzzle Load balancer..."
npm install

npm run plugins

sleep 1

pm2 start /config/processes.json

pm2 sendSignal -s USR1 KuzzleLB

nohup node-inspector --web-port=8080 --debug-port=7003 > /dev/null 2>&1&

pm2 logs
