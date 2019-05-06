#!/bin/bash
ROOT_FOLDER=`pwd`
PROJECT_ID="ambient-scope-211818"

kubectl apply -f deployment-back.yaml
kubectl apply -f deployment-front.yaml
kubectl apply -f deployment-test.yaml
kubectl apply -f ingress.yaml
kubectl apply -f deployment-cloud-endpoint.yaml