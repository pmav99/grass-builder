# A multi-stage image for compiling GRASS GIS using virtualenvs for the python
# dependencies.
#
# The benefit of having a docker image for the builds is that the builds are repeatable.
#
# The first stage builds the python wheels for all python versions.
#
# The alternative would be to The reason we build the wheels before hand is: - we don't
# want to pre-install the python dependencies in order to - Downloading from PyPi - T
#
# http://lucumr.pocoo.org/2014/1/27/python-on-wheels/
# https://pip.readthedocs.io/en/stable/user_guide/#installing-from-local-packages
# https://stackoverflow.com/questions/51678830/how-to-decrease-the-size-of-this-multistage-docker-build-for-a-python-app
#

FROM ubuntu:18.04 AS build_wheels


ARG PROJECT_NAME
ARG PROJECT_DESCRIPTION
ARG PROJECT_URL
ARG PROJECT_VENDOR
ARG VCS_URL
ARG VCS_REF
ARG IMAGE_VERSION
ARG BUILD_DATE

# Labels.
LABEL authors="Panagiotis Mavrogiorgos" \
      maintainer="pmav99@gmail.com" \
      org.label-schema.name="${PROJECT_NAME}" \
      org.label-schema.description="${PROJECT_DESCRIPTION}" \
      org.label-schema.url="${PROJECT_URL}" \
      org.label-schema.vendor="mine INC" \
      org.label-schema.vcs-url="${VCS_URL}" \
      org.label-schema.build-date="${BUILD_DATE}" \
      org.label-schema.vcs-ref="${VCS_REF}" \
      org.label-schema.version="${IMAGE_VERSION}" \
      org.label-schema.docker.cmd="docker run ..." \
      org.label-schema.schema-version="1.0"

# system environment
ENV DEBIAN_FRONTEND noninteractive

RUN apt update
RUN apt install -y \
    apt-utils \
    software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
RUN apt install -y --no-install-recommends --no-install-suggests \
    build-essential \
    python \
    python-dev \
    python3.6 \
    python3.6-dev \
    python3.7 \
    python3.7-dev \
    virtualenv
RUN apt install -y --no-install-recommends --no-install-suggests \
    libgdal-dev \
    gdal-bin

# Python 2.7
RUN virtualenv -p python2.7 venv27
RUN venv27/bin/pip install wheel
RUN venv27/bin/pip wheel --wheel-dir=/wheels pyopengl==3.1.0
RUN venv27/bin/pip wheel --wheel-dir=/wheels --global-option=build_ext --global-option="-I/usr/include/gdal" GDAL==`gdal-config --version`
RUN venv27/bin/pip wheel --wheel-dir=/wheels 'https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-18.04/wxPython-4.0.4-cp27-cp27mu-linux_x86_64.whl'
RUN venv27/bin/pip wheel --wheel-dir=/wheels numpy==1.16.1
RUN venv27/bin/pip wheel --wheel-dir=/wheels matplotlib==2.2.3

# Python 3.6
RUN virtualenv -p python3.6 venv36
RUN venv36/bin/pip install wheel
RUN venv36/bin/pip wheel --wheel-dir=/wheels pyopengl==3.1.0
RUN venv36/bin/pip wheel --wheel-dir=/wheels --global-option=build_ext --global-option="-I/usr/include/gdal" GDAL==`gdal-config --version`
RUN venv36/bin/pip wheel --wheel-dir=/wheels 'https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-18.04/wxPython-4.0.4-cp36-cp36m-linux_x86_64.whl'
RUN venv36/bin/pip wheel --wheel-dir=/wheels numpy==1.16.1
RUN venv36/bin/pip wheel --wheel-dir=/wheels matplotlib==3.0.2

# Python 3.7
RUN virtualenv -p python3.7 venv37
RUN venv37/bin/pip install wheel
RUN venv37/bin/pip wheel --wheel-dir=/wheels pyopengl==3.1.0
RUN venv37/bin/pip wheel --wheel-dir=/wheels --global-option=build_ext --global-option="-I/usr/include/gdal" GDAL==`gdal-config --version`
RUN venv37/bin/pip wheel --wheel-dir=/wheels 'https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-18.04/wxPython-4.0.4-cp37-cp37m-linux_x86_64.whl'
RUN venv37/bin/pip wheel --wheel-dir=/wheels numpy==1.16.1
RUN venv37/bin/pip wheel --wheel-dir=/wheels matplotlib==3.0.2


#####
# Second stage
#####
FROM ubuntu:18.04

COPY --from=build_wheels /wheels /wheels

COPY /scripts/install_dependencies.sh /
RUN /install_dependencies.sh
