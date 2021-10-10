#!/usr/bin/env sh
# -----------------------------------------------------------------------------
#  Docker Build Container
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni
#  License    : Apache v2
# -----------------------------------------------------------------------------
set -e

export CI_REGISTRY="hub.docker.com"
export CI_PROJECT_PATH="zeroc0d3"

export IMAGE="$CI_REGISTRY/$CI_PROJECT_PATH/ubuntu"
export TAG="20.04"

echo " Build Image => $IMAGE:$TAG"
docker build . -t $IMAGE:$TAG