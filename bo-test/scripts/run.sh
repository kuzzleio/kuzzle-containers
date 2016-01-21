#!/bin/sh
set -e

kuzzle=${KUZZLE_HOST:-kuzzle:7511}

while ! curl -silent -output /dev/null http://$kuzzle/api/v1.0 > /dev/null
do
  echo "$(date) - still trying connecting to http://$kuzzle"
  sleep 1
done
echo "$(date) - connected successfully to Kuzzle"

npm install
grunt sass
bower install --allow-root --config.interactive=false

echo "Starting Kuzzle BO..."
pm2 start /config/processes.json

nohup phantomjs --webdriver 4444 > /dev/null 2>&1&

tail -f /dev/null