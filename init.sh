#!/bin/bash

#gcloud init 

NAME_CLUSTER="k8s-ingress"
PROJECT_ID="ambient-scope-211818"
ROOT_FOLDER=`pwd`

gcloud config set project $PROJECT_ID

#git submodule update --init --recursive

#Create Cluster Kubernetes
gcloud container clusters create $NAME_CLUSTER \
--zone us-central1-a \
--num-nodes 2

#Auth kubectl
gcloud container clusters get-credentials $NAME_CLUSTER --zone us-central1-a

cd $ROOT_FOLDER/ms-dal-users
mvn compile jib:dockerBuild -Dimage=grc.io/$PROJECT_ID/ms-dal-users
docker push grc.io/$PROJECT_ID/ms-dal-users


cd $ROOT_FOLDER/example-angular-7
ng build --prod
docker build -t grc.io/$PROJECT_ID/front-user:1.0 .
docker push grc.io/$PROJECT_ID/front-user:1.0