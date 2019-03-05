#!/bin/bash

set -x # show commands
set -e # exit on error

# Fetch the version number of the latest ops-tools
TOOLS_VERSION=`npm view --json @buzuli/ops-tools | grep latest | cut -d ":" -f 2 | tr -d ' ' | tr -d '"'`
IMAGE_NAME="npmjs/ops-tools"

# Build the image
docker build . --tag $IMAGE_NAME:$TOOLS_VERSION

# Alias the image as latest
docker tag $IMAGE_NAME:$TOOLS_VERSION $IMAGE_NAME:latest

# Publish the version tag
docker push $IMAGE_NAME:$TOOLS_VERSION

# Publish the latest tag
docker push $IMAGE_NAME:latest
