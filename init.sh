#!/bin/bash

#gcloud init 

NAME_CLUSTER="k8s-ingress"
PROJECT_ID="ambient-scope-211818"
ROOT_FOLDER=`pwd`

gcloud config set project $PROJECT_ID

#git submodule update --init --recursive

#Create Cluster Kubernetes
gcloud container clusters create $NAME_CLUSTER \
--machine-type n1-standard-1 \
--zone us-central1-a \
--num-nodes 3

#Auth kubectl
gcloud container clusters get-credentials $NAME_CLUSTER --zone us-central1-a