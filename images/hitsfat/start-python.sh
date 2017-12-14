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
wd="$( dirname $(readlink -e $0) )"
echo "[+] cd to script directory '$wd'"
cd "$wd"

activate="$PYTHON_VENV/bin/activate"
if [ ! -r "$activate" ] ; then
    echo "[+] Error: virtual environment '$PYTHON_VENV' not found."
    exit 1
fi
if [ ! -r "$mainpy" ] ; then
    echo "[+] Error: script '$mainpy' not readable."
fi

echo "[+] activating virtual environment '$PYTHON_VENV'"
. "$activate"
exec python $mainpy
