FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y --no-install-recommends dnsmasq-base
COPY dnsmasq.conf /etc/dnsmasq.conf
EXPOSE 53 53/udp
ENTRYPOINT ["dnsmasq", "-k"]
