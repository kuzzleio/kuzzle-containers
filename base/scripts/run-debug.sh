#!/bin/sh


elastic=${READ_ENGINE_HOST:-elasticsearch:9200}

npm install

while ! curl -silent -output /dev/null http://$elastic > /dev/null
do
 echo "$(date) - still trying connecting to http://$elastic"
  sleep 1
done
echo "$(date) - connected successfully to ElasticSearch"

echo "Starting Kuzzle..."

node bin/kuzzle install && pm2 start /config/processes-dev.json --silent

nohup node-inspector --web-port=8080 --debug-port=7000 > /dev/null 2>&1&
nohup node-inspector --web-port=8081 --debug-port=7001 > /dev/null 2>&1&
pm2 sendSignal -s USR1 KuzzleServer
pm2 sendSignal -s USR1 KuzzleWorker

pm2 logs
