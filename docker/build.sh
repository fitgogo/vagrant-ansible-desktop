#! /bin/bash

docker build \
    -t ubuntu-jwm \
    --build-arg DOCKER_UID=$(id -u) \
    --build-arg DOCKER_USER='gucchy' \
    --build-arg DOCKER_PASSWORD='password' /vagrant/docker/.

