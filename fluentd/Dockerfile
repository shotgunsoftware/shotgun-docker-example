FROM fluent/fluentd:v1.1.0

# Install plugins
RUN apk add --update --virtual .build-deps \
    sudo build-base ruby-dev \
 && sudo gem install \
    fluent-plugin-elasticsearch \
    fluent-plugin-grok-parser \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
    /home/fluent/.gem/ruby/2.3.0/cache/*.gem

RUN mkdir -p /var/log/shotgun \
    && chmod 666 /var/log/shotgun

COPY files_docker/patterns /opt/fluentd/patterns/
COPY files_docker/fluent.conf /fluentd/etc/fluent.conf