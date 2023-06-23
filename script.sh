#!/bin/bash

echo "Creating the images.............."

docker build -t favero98/projeto-backend:1.0 backend/.
docker build -t favero98/projeto-database:1.0 database/.

echo "Realizing push the images.............."

docker push favero98/projeto-backend:1.0
docker push favero98/projeto-database:1.0

echo "Creating services on cluster Kubernetes.............."

kubectl apply -f ./services.yml

echo "Creating the deployments.............."

kubectl apply -f ./deployment.yml