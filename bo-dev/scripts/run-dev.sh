#!/bin/sh

kuzzle=${KUZZLE_HOST:-kuzzle:7511}

while ! curl -m 2 -silent -output /dev/null http://$kuzzle/api/1.0 > /dev/null
do
  echo "$(date) - still trying connecting to http://$kuzzle"
  sleep 1
done
echo "$(date) - successfully connected to Kuzzle"

echo "Installing dependencies..."
npm install
bower install --allow-root --config.interactive=false

echo "Starting Kuzzle BO in development mode..."
NODE_ENV=dev pm2 start /config/processes.json --silent

echo "Starting PhantomJS..."
rm -f /phantomjs-logs.fifo
mkfifo /phantomjs-logs.fifo

nohup phantomjs --webdriver 4444 2>&1 | tee /phantomjs-logs.fifo > /dev/null &

echo "Starting node-inspector..."
nohup node-inspector --web-port=8080 --debug-port=7002 > /dev/null 2>&1&
pm2 sendSignal -s USR1 KuzzleBo

pm2 logs
