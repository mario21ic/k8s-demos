#!/bin/bash

image="mario21ic/liveness:java-v1"

echo "## build ##"
docker build -t $image .

echo "## run ##"
docker run -d -p 8080:8080 $image

echo "## curl ##"
curl localhost:8080/

echo "## liveness ##"
curl localhost:8080/liveness

echo "## readiness ##"
curl localhost:8080/readiness

