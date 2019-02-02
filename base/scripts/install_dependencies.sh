#!/usr/bin/env bash

set -euo pipefail

# Running the commands with sudo, is convenient for copy-pasting from this script
# to other systems. But we need to make sure that it is installed first
apt update
apt install -y \
  sudo \
  apt-utils \
  software-properties-common

# This is where the GRASS stuff begin
sudo add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y --no-install-recommends --no-install-suggests \
    build-essential \
    autoconf2.13 \
    autotools-dev \
    debhelper \
    fakeroot \
    flex \
    make \
    bison \
    gcc \
    libgcc1 \
    g++ \
    clang \
    cmake \
    ccache \
    wx-common \
    wx3.0-headers \
    libwxgtk3.0-dev \
    libwxbase3.0-dev \
    libgsl-dev \
    libjpeg-dev \
    libpng-dev \
    libpnglite-dev \
    libtiff-dev \
    libtiff5-dev \
    libreadline-dev \
    dpatch \
    libatlas-base-dev \
    libncurses5-dev \
    zlib1g-dev \
    gettext \
    sqlite3 \
    libsqlite3-dev \
    libpq-dev \
    libsdl1.2-dev \
    libreadline7 \
    libboost-thread-dev \
    libboost-program-options-dev \
    subversion \
    git \
    wget \
    libavutil-dev \
    ffmpeg2theora \
    libffmpegthumbnailer-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    checkinstall \
    libglu1-mesa-dev \
    libxmu-dev \
    ghostscript \
    python \
    python-dev \
    python3.6 \
    python3.6-dev \
    python3.7 \
    python3.7-dev \
    virtualenv \
    gdal-bin \
    libgdal-dev \
    proj-bin \
    proj-data \
    libproj-dev \
    libcairo2-dev \
    libfreetype6-dev \
    libfftw3-dev

    #unixodbc-dev \
    #libblas-dev \
    #libbz2-dev \
    #libgsl0-dev \
    #liblapack-dev \
    #libnetcdf-dev \
    #libopenjp2-7 \
    #libopenjp2-7-dev \
    #libpdal-dev pdal \
    #libpdal-plugin-python \
    #libzstd-dev \
    #ncurses-bin \
    #netcdf-bin \

# Cleanup
sudo apt-get autoremove
sudo apt-get clean
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*
sudo rm -rf /var/lib/apt/lists/*
# clean up python bytecode (reduces the image size)
# The "-xdev" is required in order to exclude /proc /sys etc
# https://unix.stackexchange.com/questions/193275/how-to-exclude-the-folders-proc-and-sys-from-search-with-find-command
sudo find / -xdev -name *.pyc -delete
sudo find / -xdev -name *__pycache__* -delete

# Let's only create a normal user which will be used for building grass itself.
# The user's password is 1234
sudo useradd \
  -m \
  -s /bin/bash \
  -p '$6$QEYxAH/bBv$vHDZ0b2vvpUi3RgpZWR2aa3fGJqvsRaf.1S6yzSBVZnwMORHMjB3HXCWJezPrkSVOJb7ZgCUwKHdR60mn.aV2/' \
  builder

sudo su builder
cd /home/builder

virtualenv -p python2.7 venv27
virtualenv -p python3.6 venv36
virtualenv -p python3.7 venv37

git clone --depth=10 https://github.com/GRASS-GIS/grass-ci grass
