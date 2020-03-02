#!/bin/bash

docker build -t mario21ic/secret:golang-v1 .
docker run mario21ic/secret:golang-v1
docker run -e hello="mario21ic" mario21ic/secret:golang-v1
