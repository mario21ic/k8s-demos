#!/bin/bash
set -e
image="mario21ic/secret:golang-v1"

docker build -t $image .

docker run -d -p 8080:8080 $image
sleep 2
curl localhost:8080

docker run -d -e hello="mario21ic" -p 8081:8080 $image
sleep 2
curl localhost:8081
