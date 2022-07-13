Part2: Build/Deploy Scripts

========================================================================================================================
														Build
========================================================================================================================
Build the Docker image from part 1. The built_at should return the unix timestamp of when
the image was built.
================================================================================================================================================================================================================================================

Minikube comes with its own docker daemon and will not be able to find the Docker Images built locally hence we need to set docker-env environment variable and build the image in Minikube's Docker environment.

Assuming minikube is installed and in started state.
Here is the built_at.sh  

#!/bin/bash

eval $(minikube docker-env)

#Build the image in Part1
docker image build -q -t y42-flask:v1 ../part1_container/. >> /dev/null

#To get the timestamp of when the image was built
docker inspect -f '{{ .Created }}' y42-flask:v1





========================================================================================================================
														Deploy
========================================================================================================================
The second script should make the image from the previous step available through a locally running minikube.
deployed_at should show the unix timestamp of when this script was ran.													
================================================================================================================================================================================================================================================

I've created a K8s deployment for this and exposed it via NodePort service to be accessible from outside the minikube cluster.

imagePullPolicy has been set to Never in the y42_deployment.yml so that cluster tries to use docker images local to the minikube cluster.



#!/bin/bash

#To create y42-app deployment
kubectl apply -f y42_deployment.yml

#To expose this deployment as y42-service
kubectl apply -f y42_service.yml

#To fetch the CreatTimestamp of y42-service service
kubectl get service y42-service -o jsonpath='{.metadata.creationTimestamp}'




