#!/bin/sh

echo "Starting Kuzzle Load balancer..."
npm install

sleep 5

pm2 start /config/processes.json

pm2 sendSignal -s USR1 KuzzleLB

pm2 logs
