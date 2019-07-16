#!/bin/bash
# Usage number_version

docker build -t mario21ic/nginx:alpinev$1 .
