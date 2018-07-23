#!/bin/bash -eu

DOCKERFILE="${DOCKERFILE:-$WORKDIR/$IMAGE/Dockerfile}"
CONTEXT="${CONTEXT:-$WORKDIR/$IMAGE}"
TAG=$IMAGE_PREFIX$IMAGE:$VERSION
DOCKERFILE_FLAG=""

if [ -e $DOCKERFILE ]
then
  DOCKERFILE_FLAG="--file $DOCKERFILE"
fi

docker build --pull --build-arg IMAGE_PREFIX=$IMAGE_PREFIX --no-cache --tag $TAG --target $TARGET $DOCKERFILE_FLAG $CONTEXT