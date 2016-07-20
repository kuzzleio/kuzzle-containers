echo "Starting kibana"

/opt/kibana &

echo "Waiting to go nowhere"

tail -f /dev/null
