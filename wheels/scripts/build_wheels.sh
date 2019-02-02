apt update
apt install -y \
    apt-utils \
    software-properties-common
add-apt-repository -y ppa:deadsnakes/ppa
add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
apt install -y --no-install-recommends --no-install-suggests \
    build-essential \
    python \
    python-dev \
    python3.6 \
    python3.6-dev \
    python3.7 \
    python3.7-dev \
    virtualenv \
    libgdal-dev \
    gdal-bin

# Python 2.7
virtualenv -p python2.7 venv27
venv27/bin/pip install wheel
venv27/bin/pip wheel --wheel-dir=/wheels pyopengl==3.1.0
venv27/bin/pip wheel --wheel-dir=/wheels --global-option=build_ext --global-option="-I/usr/include/gdal" GDAL==`gdal-config --version`
venv27/bin/pip wheel --wheel-dir=/wheels 'https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-18.04/wxPython-4.0.4-cp27-cp27mu-linux_x86_64.whl'
venv27/bin/pip wheel --wheel-dir=/wheels numpy==1.16.1
venv27/bin/pip wheel --wheel-dir=/wheels matplotlib==2.2.3

# Python 3.6
virtualenv -p python3.6 venv36
venv36/bin/pip install wheel
venv36/bin/pip wheel --wheel-dir=/wheels pyopengl==3.1.0
venv36/bin/pip wheel --wheel-dir=/wheels --global-option=build_ext --global-option="-I/usr/include/gdal" GDAL==`gdal-config --version`
venv36/bin/pip wheel --wheel-dir=/wheels 'https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-18.04/wxPython-4.0.4-cp36-cp36m-linux_x86_64.whl'
venv36/bin/pip wheel --wheel-dir=/wheels numpy==1.16.1
venv36/bin/pip wheel --wheel-dir=/wheels matplotlib==3.0.2

# Python 3.7
virtualenv -p python3.7 venv37
venv37/bin/pip install wheel
venv37/bin/pip wheel --wheel-dir=/wheels pyopengl==3.1.0
venv37/bin/pip wheel --wheel-dir=/wheels --global-option=build_ext --global-option="-I/usr/include/gdal" GDAL==`gdal-config --version`
venv37/bin/pip wheel --wheel-dir=/wheels 'https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-18.04/wxPython-4.0.4-cp37-cp37m-linux_x86_64.whl'
venv37/bin/pip wheel --wheel-dir=/wheels numpy==1.16.1
venv37/bin/pip wheel --wheel-dir=/wheels matplotlib==3.0.2
