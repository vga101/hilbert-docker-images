#~~phusion/baseimage:0.9.18~~
FROM hilbert/baseimage

MAINTAINER Oleksandr Motsak <malex984+hilbert.base@gmail.com>

COPY update.sh install.sh upgrade.sh clean.sh /usr/local/bin/

# Update & Install & Clean up APT
# Not: please if possible add all the packages to the following single install command!
RUN update.sh && upgrade.sh \
 && install.sh bash wget curl git cups-bsd p7zip-full pciutils bzip2 ca-certificates \
 && clean.sh

# dist-upgrade ?

### RUN groupadd -r ur && useradd -r -g ur ur
#RUN groupadd -f -g 1000 ur
#RUN adduser --disabled-login --uid 1000 --gid 1000 --gecos 'non-root-user' ur
#RUN usermod -a -G sudo ur
#RUN mkdir -p /etc/sudoers.d && echo "ur ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ur && chmod 0440 /etc/sudoers.d/ur
# USER ur
# ENV HOME /home/ur
### VOLUME $HOME # ?
# WORKDIR $HOME

COPY setup_ogl.sh hb.sh hb_wrapper.sh config_cups.sh /usr/local/bin/
#RUN chmod +x /usr/local/bin/config_cups.sh

# RUN locale-gen de_DE.utf8 && locale-gen ru_RU.utf8

#ADD https://raw.githubusercontent.com/phusion/baseimage-docker/master/image/bin/my_init /sbin/my_init
#RUN chmod +x /sbin/my_init

# Use baseimage-docker's init system.
# CMD ["/sbin/my_init"]

## ENTRYPOINT ["/sbin/my_init"]


ARG IMAGE_VERSION=latest
# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE=someday
ARG VCS_REF=HEAD
ARG VCS_URL="https://github.com/hilbert/hilbert-docker-images"
# ARG VERSION=${IMAGE_VERSION}
ARG GIT_NOT_CLEAN_CHECK
ARG DOCKERFILE="/images/base/Dockerfile"

LABEL org.label-schema.build-date="${BUILD_DATE}" \
      org.label-schema.name="Hilbert" \
      org.label-schema.description="Base docker image for most apps and services of Hilbert" \
      org.label-schema.vendor="IMAGINARY gGmbH" \
      org.label-schema.url="https://hilbert.github.io" \
      org.label-schema.vcs-ref="${VCS_REF}" \
      org.label-schema.vcs-url="${VCS_URL}" \
      org.label-schema.version="${IMAGE_VERSION}" \
      org.label-schema.schema-version="1.0" \
      com.microscaling.license="Apache-2.0" \
      com.microscaling.docker.dockerfile="${DOCKERFILE}" \
      IMAGE_VERSION="${IMAGE_VERSION}" \
      GIT_NOT_CLEAN_CHECK="${GIT_NOT_CLEAN_CHECK}"


ONBUILD LABEL org.label-schema.build-date="" \
      org.label-schema.name="" \
      org.label-schema.description="" \
      org.label-schema.vendor="" \
      org.label-schema.url="" \
      org.label-schema.vcs-ref="" \
      org.label-schema.vcs-url="" \
      org.label-schema.version="" \
      org.label-schema.schema-version="" \
      com.microscaling.license="" \
      com.microscaling.docker.dockerfile="" \
      IMAGE_VERSION="" \
      GIT_NOT_CLEAN_CHECK=""
