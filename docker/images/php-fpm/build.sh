#!/usr/bin/env bash

docker build \
    --pull \
    -f Dockerfile \
    -t alenaobraz/php:8.5-fpm-alpine \
    .
