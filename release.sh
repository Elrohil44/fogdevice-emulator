#!/bin/bash

set -e

VERSION=`cat ./version`

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push elrohil/fogdevice-emulator:latest
docker push elrohil/fogdevice-emulator:${VERSION}