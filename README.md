# Shotgun Docker Example

This repository contains an example configuration of Shotgun as a [docker](https://www.docker.com) container with [docker-compose](https://www.docker.com) orchestration.

## Getting started

Clone this repository 

    git clone git@github.com:shotgunsoftware/shotgun-docker-example.git

You then need to acquire the latest version of the Shotgun container from the Shotgun Account Center, and load it into docker
    
    gunzip shotgun-docker-se.7.2.3.0.tar.gz
    sudo docker load < shotgun-app.7.2.3.0.tar

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

