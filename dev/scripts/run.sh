#!/bin/sh

elastic=${READ_HOST:-elasticsearch:9200}
rabbit=${MQ_BROKER_HOST:-rabbit}
rabbitPort=${MQ_BROKER_PORT:-5672}

while ! curl -silent -output /dev/null http://$elastic > /dev/null
do
  echo "$(date) - still trying connecting to http://$elastic"
  sleep 1
done
echo "$(date) - connected successfully to ElasticSearch"

if  [ -n "$MQ_BROKER_ENABLED" ]; then
  while ! nmap -p $rabbitPort $rabbit
  do
    echo "$(date) - still trying connecting to http://$rabbit:$rabbitPort"
    sleep 1
  done
  echo "$(date) - connected successfully to RabbitMQ"
fi

echo "Starting Kuzzle..."

pm2 start /config/processes-dev.json
pm2 logs
