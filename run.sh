#!/bin/bash
docker build -t lambda-layer-builder . && \
docker run --rm -v $PWD:/var/task lambda-layer-builder 