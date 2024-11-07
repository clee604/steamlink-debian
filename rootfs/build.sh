#!/usr/bin/env bash

docker build . --platform linux/arm/v7 --rm --tag deblink
docker rm deblink || true
docker create --platform linux/arm/v7 -t -i --name deblink deblink

docker export deblink -o deblink.tar