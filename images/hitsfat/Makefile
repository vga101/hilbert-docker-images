mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))

# image tag defined in "TAG" file
# it should correspond to hilbert/kiosk tag plus hitsfat extension
# e.g. "0.2.0-1" ("0.2.0" is hilbert/kiosk version, "-1" is hitsfat version number)
IMAGE_VERSION := $(shell cat TAG)

# site-specific settings
include ../../../Makefile-local.inc

U = hits
APP  = hitsfat

# default variables and targets
include ../Makefile.inc

# tag and push:
# also tag as "latest"
TAGLATEST  ?= ${REGISTRY}/${U}/${APP}:latest

build-tag-push-latest: build-tag-push
	$(DOCKER) tag "${IMG}" "${TAGLATEST}"
	$(DOCKER) push "${TAGLATEST}"
	$(ECHO) "Created and pushed tag '${TAGLATEST}' for image '${IMG}'"

