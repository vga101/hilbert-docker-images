#! /bin/bash

ARGS=$@
[ -z "${ARGS}" ] && ARGS="--kiosk http://localhost:8080/"

exec chrome.sh --no-first-run --user-data-dir=$HOME --no-default-browser-check --no-sandbox ${ARGS}
