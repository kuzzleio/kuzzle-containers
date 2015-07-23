# Consul-template

[Consul-template](https://github.com/kuzzleio/kuzzle-containers.git) in a box.

## How to use

This container exposes the consul-template executable as an entrypoint.

You will probably need to expose some volumes and your docker socket to run consul-template.

For instance:

```
docker run -d --name haproxy -v /usr/local/etc/haproxy haproxy:1.5
docker run -d --name consul-templates -v /path/to/templates:/volume/templates busybox
docker run -d --name consul -h node1 progrium/consul -server -bootstrap 

docker run -d \
--volumes-from haproxy \
--volumes-from consul-templates \
-v /usr/bin/docker:/usr/bin/docker \
-v /var/run/docker.sock:/var/run/docker.sock \
--link consul:consul \
kuzzleio/consul-template \
-consul consul:8500 \
-template "/volume/templates/haproxy/haproxy.cfg.tpl:/usr/local/etc/haproxy/haproxy.cfg:docker exec haproxy service haproxy restart"

```
