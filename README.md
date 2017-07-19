# Shotgun Docker Example

This repository contains an example configuration of Shotgun as a [docker](https://www.docker.com) container with [docker-compose](https://www.docker.com) orchestration.

## Getting started

Clone this repository 

    git clone git@github.com:shotgunsoftware/shotgun-docker-example.git

You then need to acquire the latest version of the Shotgun containers from the Shotgun Account Center, and load them into docker
    
    gunzip shotgun-docker-se.7.2.3.0.tar.gz
    gunzip shotgun-docker-se-transcoder-7.1.0.0.tar.gz
    sudo docker load < shotgun-docker-se.7.2.3.0.tar
    sudo docker load < shotgun-docker-se-transcoder-7.1.0.0.tar

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

