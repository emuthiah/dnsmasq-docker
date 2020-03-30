# dnsmasq-docker
Simple dns service using docker

## Docker
### build
```
git clone https://github.com/emuthiah/dnsmasq-docker.git
cd dnsmasq-docker
docker build -t dnsmasq:latest .
```
### Run
`--cap-add NET_ADMIN` is needed for dnsmasq to run, `--dns 127.0.0.1` makes sure that the container uses localhost dnsmasq for dns. This is also useful when other containers are attached to this containers network
```
docker run -it --rm --cap-add NET_ADMIN --name dnsmasq --dns 127.0.0.1 dnsmasq:latest
```
### Optional
Run another container attached to dnsmasq network
```
docker run -it --rm --network container:dnsmasq --name ubuntu ubuntu:latest
```
### Find ip address of dnsmasq container
```
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' dnsmasq
```
