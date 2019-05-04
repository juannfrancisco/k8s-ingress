#!/bin/bash

#gcloud init 

NAME_CLUSTER="k8s-ingress"
PROJECT_ID="ambient-scope-211818"
ROOT_FOLDER=`pwd`

gcloud config set project $PROJECT_ID

#git submodule update --init --recursive

#Create Cluster Kubernetes
gcloud container clusters create $NAME_CLUSTER \
--machine-type g1-small \
--zone us-central1-a \
--num-nodes 2

#Auth kubectl
gcloud container clusters get-credentials $NAME_CLUSTER --zone us-central1-a