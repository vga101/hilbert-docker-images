#!/bin/sh
#
# Start a python script:
# - use python virtual environment and python version as specified by PYTHON_VENV environment variable
# - working directory is the script directory
# - exec so that it receives unix signals

# python file to start
mainpy="$1"

# path to virtual environment, with default value
PYTHON_VENV=${PYTHON_VENV:-/opt/venv2}

# change working directory
echo "== cd to script directory"
wd="$( dirname $(readlink -e $0) )"
cd "$wd"

activate="$PYTHON_VENV/bin/activate"
if [ -r "$activate" ] ; then
    echo "== activating virtual environment"
    . "$activate"
    exec python $mainpy
else
    echo "Error: virtual environment '$PYTHON_VENV' not found."
    exit 1
fi

