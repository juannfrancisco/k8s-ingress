#!/bin/bash
ROOT_FOLDER=`pwd`
PROJECT_ID="ambient-scope-211818"

cd $ROOT_FOLDER/ms-dal-users
mvn compile jib:dockerBuild -Dimage=gcr.io/$PROJECT_ID/ms-dal-users:1.0.0
docker push gcr.io/$PROJECT_ID/ms-dal-users:1.0.0


cd $ROOT_FOLDER/example-angular-7
npm install && ng build --prod
docker build -t gcr.io/$PROJECT_ID/front-user:1.0 .
docker push gcr.io/$PROJECT_ID/front-user:1.0