# Build the main image
# http://lucumr.pocoo.org/2014/1/27/python-on-wheels/
# https://pip.readthedocs.io/en/stable/user_guide/#installing-from-local-packages
FROM ubuntu:18.04

ARG AUTHORS
ARG MAINTAINERS
ARG PROJECT_NAME
ARG PROJECT_DESCRIPTION
ARG PROJECT_URL
ARG PROJECT_VENDOR
ARG VCS_URL
ARG VCS_REF
ARG IMAGE_VERSION
ARG BUILD_DATE

# Labels.
LABEL authors="{$AUTHORS}" \
      maintainers="${MAINTAINERS}" \
      org.label-schema.name="${PROJECT_NAME}" \
      org.label-schema.description="${PROJECT_DESCRIPTION}" \
      org.label-schema.url="${PROJECT_URL}" \
      org.label-schema.vendor="mine INC" \
      org.label-schema.vcs-url="${VCS_URL}" \
      org.label-schema.docker.cmd="docker run ..." \
      org.label-schema.schema-version="1.0"

COPY --from=quay.io/pmav99/grass_builder_wheels:latest /wheels /wheels

COPY /scripts/install_dependencies.sh /
RUN /install_dependencies.sh

LABEL org.label-schema.build-date="${BUILD_DATE}" \
      org.label-schema.vcs-ref="${VCS_REF}" \
      org.label-schema.version="${IMAGE_VERSION}" \
