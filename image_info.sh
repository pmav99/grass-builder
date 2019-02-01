#
# Defines the docker image information
#

set -euo pipefail

# Registry stuff
REGISTRY='quay.io'
ORGANIZATION='pmav99'
REPOSITORY='grass-builder'
IMAGE_VERSION='0.1.1'

# LABELS
PROJECT_NAME='grass-builder'
PROJECT_DESCRIPTION='Repeatable linux builds for GRASS GIS using either Python 2 and 3'
PROJECT_URL='https://grass.osgeo.org/'
PROJECT_VENDOR="mine INC"
VCS_URL="https://github.com/pmav99/grass-builder"
