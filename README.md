# ShotGrid Docker Example

This repository contains an example configuration of ShotGrid as a [docker](https://www.docker.com) container with [docker-compose](https://www.docker.com) orchestration.

## Getting started

Clone this repository 

    git clone git@github.com:shotgunsoftware/shotgun-docker-example.git

You then need to acquire the latest version of the ShotGrid containers from the ShotGrid Account Center, and load them into docker

    tar -xvf shotgun-docker-se-X.X.X.X.tar.gz
    sudo docker load < shotgun/se/shotgrid-app.X.X.X.X.tar
    
Update the `docker-compose.yml` file and put the matching versions of the docker images in place of `%VERSION%`.

You can then start ShotGrid and all required containers using

    sudo docker-compose up -d
    
The ShotGrid application will be available at http://localhost
    
## Logging into ShotGrid

Find the shotgun_admin password in the app container log

    docker-compose logs app | grep "shotgun_admin password"

Login with a browser on the host machine:

  * URL:      http://localhost
  * login:    shotgun_admin
  * password: {found in the log}
