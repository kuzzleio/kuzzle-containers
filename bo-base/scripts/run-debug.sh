#!/bin/sh

kuzzle=${KUZZLE_HOST:-kuzzle:7511}

while ! curl -silent -output /dev/null http://$kuzzle/api/1.0 > /dev/null
do
  echo "$(date) - still trying connecting to http://$kuzzle"
  sleep 1
done
echo "$(date) - successfully connected to Kuzzle"

echo "Installing dependencies..."
npm install
bower install --allow-root --config.interactive=false

echo "Building Kuzzle BO..."
npm run build

echo "Starting Kuzzle BO..."
pm2 start /config/processes.json --silent

nohup node-inspector --web-port=8082 --debug-port=7002 > /dev/null 2>&1&
pm2 sendSignal -s USR1 KuzzleBo

pm2 logs
