#!/bin/bash

docker build -t mario21ic/secret:rust-v1 .

docker run -v /etc/secret/hello:/etc/secret/hello -p 8080:8080 mario21ic/secret:rust-v1
