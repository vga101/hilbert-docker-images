FROM hilbert/kiosk

LABEL maintainer "Volker Gaibler <volker.gaibler@h-its.org>"

# system packages
RUN /usr/local/bin/update.sh \
    && /usr/local/bin/install.sh \
            # python (2 and 3), kivy
            python-pip \
            python3-pip \
            build-essential \
            git \
            python \
            python-dev \
            python3 \
            python3-dev \
            libav-tools \
            libsdl2-dev \
            libsdl2-image-dev \
            libsdl2-mixer-dev \
            libsdl2-ttf-dev \
            libportmidi-dev \
            libswscale-dev \
            libavformat-dev \
            libavcodec-dev \
            zlib1g-dev \
            libgstreamer1.0 \
            gstreamer1.0-plugins-base \
            gstreamer1.0-plugins-good \
            # java, gaia sky, ...
            # .....
            # convencience
            nano \
            vim \
    && /usr/local/bin/clean.sh


COPY setup-venv.sh cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb /opt/admin/

# 2nd cache
RUN dpkg -i /opt/admin/cuda-repo-*.deb \
    && /usr/local/bin/update.sh \
    && /usr/local/bin/install.sh \
            x11-apps \
            dstat \
            bash-completion \
            # bonsai
            cmake \
            cuda-runtime-7-5 \
            cuda-7-5 \
            freeglut3-dev \
            # gaia sky
            default-jre \
            default-jdk \
    && /usr/local/bin/clean.sh


RUN pip2 install --upgrade pip virtualenv setuptools \
    && pip3 install --upgrade pip virtualenv setuptools

    
    ###### broken here for caching during development

    # pre-install virtual environment for kivy and several other packages
RUN cd /opt/admin/ && ./setup-venv.sh \
    #
    # java & gaia sky
    # ...
    && echo "DONE."


# ARG IMAGE_VERSION=latest
# ARG GIT_NOT_CLEAN_CHECK
# ARG BUILD_DATE=unknown
# ARG VCS_REF=HEAD
# ARG VCS_URL="https://github.com/hilbert/hilbert-docker-images"
# 
# ARG DOCKERFILE="/images/kiosk/Dockerfile"
# LABEL org.label-schema.description="Fat image containing Kiosk-mode browser, python, java and more for several interactives" \
#       org.label-schema.build-date="${BUILD_DATE}" \
#       org.label-schema.vcs-ref="${VCS_REF}" \
#       org.label-schema.vcs-url="${VCS_URL}" \
#       org.label-schema.version="${IMAGE_VERSION}" \
#       com.microscaling.docker.dockerfile="${DOCKERFILE}" \
#       IMAGE_VERSION="${IMAGE_VERSION}" \
#       GIT_NOT_CLEAN_CHECK="${GIT_NOT_CLEAN_CHECK}" \
#       org.label-schema.vendor="HITS gGmbH"

