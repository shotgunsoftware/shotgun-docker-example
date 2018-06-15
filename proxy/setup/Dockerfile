FROM haproxy:1.8-alpine
MAINTAINER Autodesk <info@autodesk.com>

RUN apk add --no-cache \
    socat \
    supervisor \
    rsyslog

RUN sed -i '/imklog.so/d' /etc/rsyslog.conf
RUN mkdir -p /usr/local/etc/haproxy/config /usr/local/etc/haproxy/certs

COPY files_docker/etc/supervisord.conf /etc/supervisord.conf
COPY files_docker/etc/rsyslog.d/haproxy.conf /etc/rsyslog.d/haproxy.conf
COPY files_docker/usr/local/sbin/haproxy-reload /usr/local/sbin/haproxy-reload

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
