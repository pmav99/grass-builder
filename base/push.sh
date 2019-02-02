#!/usr/bin/env bash
#
# Push the image to the registry
#


set -euo pipefail

source image_info.sh
docker push "${REGISTRY}"/"${ORGANIZATION}"/"${REPOSITORY}":'latest'
docker push "${REGISTRY}"/"${ORGANIZATION}"/"${REPOSITORY}":"${IMAGE_VERSION}"
