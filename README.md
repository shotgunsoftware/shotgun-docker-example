# Shotgun Docker Example

This repository contains an example configuration of Shotgun as a [docker](https://www.docker.com) container with [docker-compose](https://www.docker.com) orchestration.

## Getting started

Clone this repository 

    git clone git@github.com:shotgunsoftware/shotgun-docker-example.git

You then need to acquire the latest version of the Shotgun containers from the Shotgun Account Center, and load them into docker
    
    gunzip shotgun-docker-se.7.2.3.0.tar.gz
    gunzip shotgun-docker-se-transcoder-server-5.0.5.tar.gz
    gunzip shotgun-docker-se-transcoder-worker-8.1.6.tar.gz
    sudo docker load < shotgun-docker-se.7.2.3.0.tar
    sudo docker load < shotgun-docker-se-transcoder-server-5.0.5.tar
    sudo docker load < shotgun-docker-se-transcoder-worker-8.1.6.tar

Update the `docker-compose.yml` file and put the matching versions of the docker images in place of `%VERSION%`.

You can then start Shotgun and all required containers using

    sudo docker-compose up -d
    
The Shotgun application will be available at http://localhost
    
## Logging into Shotgun

Find the shotgun_admin password in the app container log

    docker-compose logs app | grep "shotgun_admin password"

Login with a browser on the host machine:

  * URL:      http://localhost
  * login:    shotgun_admin
  * password: {found in the log}

# Enterprise ELK

This solution uses [Fluentd](https://www.fluentd.org/) as the data collector between the shotgun application and the Elasticsearch database.

## Getting started

Start Fluentd and Elasticsearch along with Kibana.

    sudo docker-compose up -d
    
Change the shotgun application logging driver in its `docker-compose.yml` file from `json-file` to `fluentd`.

```yaml
# json-file
logging:
  driver: "json-file"
  options:
    max-size: "2g"
    max-file: "20"
        
# fluentd
logging:
  driver: "fluentd"
  options:
    fluentd-address: "<elk_stack_ip>:24224"
    tag: "sg.app.{{.ID}}"
```

## Kibana's saved objects

Index-patterns, searches, visualizations and dashboards are saved objects that can be inject in Kibana by default when it starts.

### Workflow

The workflows to add new default saved objects are the following:

From the api:

1. In Kibana, create your searches and visualizations to build your dashboards with.
2. In the management tab, you want to select your new dashboard and look for its id.
3. Using the Kibana api, you can export a dashboard and all its dependencies with this `curl -XGET <kibana_hostname>:5601/api/kibana/dashboards/export?dashboard=<dashboard_id> > dashboard.json`.
4. From the exported json, copy the saved object into its appropriate provisioning file.
5. Rebuild the container with `docker-compose build`.
6. Start the new container with `docker-compose up`.

or from the ui:

1. In Kibana, create your searches and visualizations to build your dashboards with.
2. In the management tab, you want to select and export (json) your new saved objects.
3. From the provisioning directory, copy an existing object in the `objects` array as a template for the new one.
4. From your export.json, copy the content of the field `_id` to `id` and the content of the object `_source` to `attributes`.
5. Rebuild the container with `docker-compose build`.
6. Start the new container with `docker-compose up`.

> In the `kibana/files_docker/provisioning/` directory, you will find the appropriate json file to add your new saved objects.

### Documentation

https://github.com/elastic/kibana/pull/10858

## How to access logs

### Kibana

Logs can be access via Kibana at [http://localhost:5601/](http://localhost:5601/)

From there you can create your indexes (ex: `shotgun_logs-*` already created by default) and then query Elasticsearch.

Saved objects can be provisioned by default by modifying the appropriate json file in the `kibana/files_docker/provisioning/` directory.

### Log file

Logs are also available (not by default) in json file in the `logs/` directory.

## Fluentd

### Config

All the configuration takes place in the `fluentd/files_docker/fluent.conf` file.

[Documentation](https://docs.fluentd.org/v1.0/articles/config-file)

### Plugin

For Elasticsearch, we use the [fluent-plugin-elasticsearch](https://github.com/uken/fluent-plugin-elasticsearch) plugin.

To install additional plugin see the Dockerfile at `fluentd/Dockerfile`.