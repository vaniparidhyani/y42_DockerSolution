#!/bin/bash

eval $(minikube docker-env)

#Build the image in Part1
docker image build -q -t y42-flask:v1 ../part1_container/. >> /dev/null

#To get the timestamp of when the image was built
docker inspect -f '{{ .Created }}' y42-flask:v1
