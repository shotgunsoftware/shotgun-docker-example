FROM docker.elastic.co/kibana/kibana:6.2.1

COPY files_docker/docker-entrypoint.sh /docker-entrypoint.sh
COPY files_docker/provisioning.sh /provisioning.sh
COPY files_docker/provisioning /kibana/provisioning

ENTRYPOINT [ "/docker-entrypoint.sh" ]