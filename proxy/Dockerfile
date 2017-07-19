FROM haproxy:1.7-alpine
MAINTAINER Autodesk <info@autodesk.com>

RUN apk add --no-cache socat
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY errors/ /usr/local/etc/haproxy/errors/

# Uncomment to enable https
# COPY combined_cert.pem /usr/local/etc/haproxy/ssl/combined_cert.pem
