#!/usr/bin/env bash
#
# Build the docker image
#

set -euo pipefail

source image_info.sh

docker build \
  -t "${REGISTRY}"/"${ORGANIZATION}"/"${REPOSITORY}":'latest' \
  -t "${REGISTRY}"/"${ORGANIZATION}"/"${REPOSITORY}":"${IMAGE_VERSION}" \
  -f Dockerfile \
  ./
