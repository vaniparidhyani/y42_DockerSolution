#!/bin/bash

#To create y42-app deployment
kubectl apply -f y42_deployment.yml

#To expose this deployment as y42-service
kubectl apply -f y42_service.yml

#To fetch the CreatTimestamp of y42-service service
kubectl get service y42-service -o jsonpath='{.metadata.creationTimestamp}'
