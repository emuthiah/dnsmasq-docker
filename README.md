# dnsmasq-docker
Simple dns service using docker

## Docker
### build
```
git clone https://github.com/emuthiah/dnsmasq-docker.git
cd dnsmasq-docker
docker build -t dnsmasq:latest .
```
OR
### Pull
```
docker pull emuthiah/dnsmasq
```
### Run
```
docker run -it --rm --cap-add NET_ADMIN --name dnsmasq --dns 127.0.0.1 dnsmasq:latest
```
`--cap-add NET_ADMIN` is needed for dnsmasq to run, `--dns 127.0.0.1` makes sure that container uses localhost dnsmasq for dns. This is also useful when other containers are attached to this containers network
### Optional
Run container attached to dnsmasq network
```
docker run -it --rm --network container:dnsmasq --name ubuntu ubuntu:latest
```
Run container with dns pointing to dnsmasq container IP address
```
docker run -it --rm --dns <dnsmasq IP address> --name ubuntu ubuntu:latest
```
### Find IP address of dnsmasq container
```
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' dnsmasq
```
## System
Update system network settings to use dnsmasq container IP address as dns server

## DNS Queries
View container logs and grep for queries
```
docker logs dnsmasq --follow | grep "query\[.*\]" 
```
Output
```
dnsmasq[1]: query[A] docs.docker.com from 172.17.0.1
dnsmasq[1]: query[A] fonts.googleapis.com from 172.17.0.1
dnsmasq[1]: query[AAAA] docs.docker.com from 172.17.0.1
dnsmasq[1]: query[AAAA] fonts.googleapis.com from 172.17.0.1
dnsmasq[1]: query[A] www-googletagmanager.l.google.com from 172.17.0.1
dnsmasq[1]: query[AAAA] www-googletagmanager.l.google.com from 172.17.0.1
```
