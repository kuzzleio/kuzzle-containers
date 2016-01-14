#!/bin/sh

kuzzle=${KUZZLE_HOST:-kuzzle:7511}

while ! curl -silent -output /dev/null http://$kuzzle/api/v1.0 > /dev/null
do
  echo "$(date) - still trying connecting to http://$kuzzle"
  sleep 1
done
echo "$(date) - connected successfully to Kuzzle"

echo "Starting Kuzzle BO..."
pm2 start /config/processes.json

nohup node-inspector --web-port=8080 --debug-port=7002 > /dev/null 2>&1&
pm2 sendSignal -s USR1 KuzzleBo

pm2 logs