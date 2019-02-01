FROM alpine

LABEL maintainer="pmav99@gmail.com"

ARG PROJECT_NAME
ARG PROJECT_DESCRIPTION
ARG PROJECT_URL
ARG PROJECT_VENDOR
ARG VCS_URL
ARG VCS_REF
ARG IMAGE_VERSION
ARG BUILD_DATE

# Labels.
LABEL org.label-schema.name="${PROJECT_NAME}" \
      org.label-schema.description="${PROJECT_DESCRIPTION}" \
      org.label-schema.url="${PROJECT_URL}" \
      org.label-schema.vendor="mine INC" \
      org.label-schema.vcs-url="${VCS_URL}" \
      org.label-schema.build-date="${BUILD_DATE}" \
      org.label-schema.vcs-ref="${VCS_REF}" \
      org.label-schema.version="${IMAGE_VERSION}" \
      org.label-schema.docker.cmd="docker run ..." \
      org.label-schema.schema-version="1.0"
