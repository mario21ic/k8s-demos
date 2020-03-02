#!/bin/bash

docker build -t mario21ic/configmap:python-v1 .

echo "Default"
docker run -d -p 8080:8080 mario21ic/configmap:python-v1
sleep 3
curl localhost:8080

echo "Change Value"
docker run -d -e MY_KEY="helloss" -p 8081:8080 mario21ic/configmap:python-v1
sleep 3
curl localhost:8081
