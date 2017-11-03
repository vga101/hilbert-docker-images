mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
# IMAGE_VERSION ?= latest

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

