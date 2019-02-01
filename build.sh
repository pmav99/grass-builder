#!/usr/bin/env bash
#
# Build the docker image
#

set -euo pipefail

source image_info.sh

docker build \
  --build-arg PROJECT_NAME="${PROJECT_NAME}" \
  --build-arg PROJECT_DESCRIPTION="${PROJECT_DESCRIPTION}" \
  --build-arg PROJECT_URL="${PROJECT_URL}" \
  --build-arg PROJECT_VENDOR="${PROJECT_VENDOR}" \
  --build-arg VCS_URL="${VCS_URL}" \
  --build-arg IMAGE_VERSION="${IMAGE_VERSION}" \
  --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
  --build-arg VCS_REF=`git rev-parse --short HEAD` \
  -t "${REGISTRY}"/"${ORGANIZATION}"/"${REPOSITORY}":'latest' \
  -t "${REGISTRY}"/"${ORGANIZATION}"/"${REPOSITORY}":"${IMAGE_VERSION}" \
  -f Dockerfile \
  ./
