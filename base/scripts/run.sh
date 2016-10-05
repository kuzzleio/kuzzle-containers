#!/bin/sh

elastic=${READ_ENGINE_HOST:-elasticsearch:9200}

while ! curl -silent -output /dev/null http://$elastic > /dev/null
do
  echo "$(date) - still trying connecting to http://$elastic"
  sleep 1
done
echo "$(date) - connected successfully to ElasticSearch"

echo "Starting Kuzzle..."

node bin/kuzzle install && pm2 start /config/processes-dev.json --silent
pm2 logs
