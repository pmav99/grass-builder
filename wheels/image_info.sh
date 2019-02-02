#
# Defines the docker image information
#

set -euo pipefail

# Registry stuff
REGISTRY='quay.io'
ORGANIZATION='pmav99'
REPOSITORY='grass-builder'
IMAGE_VERSION='0.1.0'
AUTHORS='Panagiotis Mavrogiorgos'
MAINTAINERS='pmav99@gmail.com'

# LABELS
PROJECT_NAME='grass-builder-wheels'
PROJECT_DESCRIPTION='Repeatable linux builds for GRASS GIS using either Python 2 and 3 - Wheels'
PROJECT_URL='https://grass.osgeo.org/'
PROJECT_VENDOR="Panagiotis Mavrogiorgos"
VCS_URL="https://github.com/pmav99/grass-builder"
