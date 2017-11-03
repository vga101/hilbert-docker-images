#!/bin/bash
#
# Install kivy and several other packages we use into virtual environments
# Volker Gaibler, 2017
#
# module combinations
# https://kivy.org/docs/installation/installation-linux.html#ubuntu-11-10-or-newer#common-dependencies
# [note: numpy is not a dependency, only added because install may be slow]
#
# use them as usual, e.g. for the python2 version of kivy 1.9.1 call
# . /opt/kivy/venv/py2-1.9.1/bin/activate

# failure exit codes are fatal
set -e

# setup virtual environments under this directory: can be activated at user's convenience
prefix=/opt

mkdir -p "$prefix"
for v in 2 3 ; do
    pip=pip$v
    dir="$prefix/venv$v"
    echo "### Setting up new virtual environment under $dir ..."
    virtualenv -p /usr/bin/python$v "$dir"
    source "$dir/bin/activate"


    # tested version combinations are grouped

    # kivy 1.8.0
    #$pip install Cython==0.20.2
    #$pip install kivy==1.8.0

    # kivy 1.9.1
    $pip install Cython==0.23
    $pip install kivy==1.9.1

    # kivy 1.10.0
    #$pip install Cython==0.25.2
    #4pip install kivy==1.10.0

    $pip install numpy==1.13.3

    # touch-controller Cython==0.21.1, really needed???
    $pip install Pillow==2.3.0
    $pip install PyYAML==3.10
    $pip install Twisted==13.2.0
    $pip install autobahn==0.16.0
    # if required by kivy (SDL being used or not)
    # pygame==1.9.2

    $pip install pyserial==3.0.1
    $pip install tornado==3.1.1


    deactivate
done

