FROM haproxy:1.8-alpine
MAINTAINER Autodesk <info@autodesk.com>

RUN apk add --no-cache \
    socat \
    supervisor \
    rsyslog

RUN sed -i '/imklog.so/d' /etc/rsyslog.conf

COPY files_docker/etc/supervisord.conf /etc/supervisord.conf
COPY files_docker/etc/rsyslog.d/haproxy.conf /etc/rsyslog.d/haproxy.conf
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY errors/ /usr/local/etc/haproxy/errors/

# Uncomment to enable https
# COPY combined_cert.pem /usr/local/etc/haproxy/ssl/combined_cert.pem

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
