#!/bin/bash

set -e

VERSION=`cat ./version`

docker build -t elrohil/fogdevice-emulator:latest -t elrohil/fogdevice-emulator:${VERSION} ./