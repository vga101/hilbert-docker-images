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

## build: build_compose

CMD=bash
# CMD=hb_wrapper.sh launch.sh browser.sh -l file:///I/webgl_SphereProjection.html?HB_URL=http://127.0.0.1:8888&HB_APP_ID=${APP}

#check: $(TS)
#	export IMAGE_VERSION=${IMAGE_VERSION}
#	$(COMPOSE) -p $(COMPOSE_PROJECT_NAME) run --rm ${APP} ${CMD}
#	unset IMAGE_VERSION

