FROM haproxy:2.0
MAINTAINER Autodesk <info@autodesk.com>

RUN apt-get update && apt-get install -y \
    socat \
    supervisor

RUN mkdir -p /usr/local/etc/haproxy/config /usr/local/etc/haproxy/certs

COPY files_docker/etc/supervisord.conf /etc/supervisord.conf
COPY files_docker/usr/local/sbin/haproxy-reload /usr/local/sbin/haproxy-reload

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
