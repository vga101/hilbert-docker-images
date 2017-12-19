# base image digest:
# latest (as of 2017-11-24)
FROM hilbert/kiosk@sha256:2298244fa569850b5789dfd9a6564728f7671cf5f323b957404dd671936004c6

RUN \
    # oracle java 1.8 for Gaia Sky 1.5
    apt-add-repository --yes ppa:webupd8team/java \
    && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
    # add cuda repository, taken from hilbert-docker-images/images/cuda_runtime/Dockerfile
    && NVIDIA_GPGKEY_SUM=d1be581509378368edeec8c1eb2958702feedf3bc3d17011adbf24efacce4ab5 \
    && NVIDIA_GPGKEY_FPR=ae09fe4bbd223a84b2ccfce3f60f4b3d7fa2af80 \
    && apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/7fa2af80.pub \
    && apt-key adv --export --no-emit-version -a $NVIDIA_GPGKEY_FPR | tail -n +2 > cudasign.pub \
    && echo "$NVIDIA_GPGKEY_SUM  cudasign.pub" | sha256sum -c --strict - && rm cudasign.pub \
    && echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64 /" > /etc/apt/sources.list.d/cuda.list
ENV CUDA_VERSION 7.5.18
ENV CUDA_PKG_VERSION 7-5=7.5-18
ENV PATH /usr/local/cuda/bin:${PATH}
ENV LIBRARY_PATH /usr/local/cuda/lib64/stubs:${LIBRARY_PATH}
LABEL com.nvidia.cuda.version="${CUDA_VERSION}

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
            # cuda_runtime
            cuda-nvrtc-$CUDA_PKG_VERSION \
            cuda-cusolver-$CUDA_PKG_VERSION \
            cuda-cublas-$CUDA_PKG_VERSION \
            cuda-cufft-$CUDA_PKG_VERSION \
            cuda-curand-$CUDA_PKG_VERSION \
            cuda-cusparse-$CUDA_PKG_VERSION \
            cuda-npp-$CUDA_PKG_VERSION \
            cuda-cudart-$CUDA_PKG_VERSION \
            # cuda_devel
            cuda-core-$CUDA_PKG_VERSION \
            cuda-misc-headers-$CUDA_PKG_VERSION \
            cuda-command-line-tools-$CUDA_PKG_VERSION \
            cuda-license-$CUDA_PKG_VERSION \
            cuda-nvrtc-dev-$CUDA_PKG_VERSION \
            cuda-cusolver-dev-$CUDA_PKG_VERSION \
            cuda-cublas-dev-$CUDA_PKG_VERSION \
            cuda-cufft-dev-$CUDA_PKG_VERSION \
            cuda-curand-dev-$CUDA_PKG_VERSION \
            cuda-cusparse-dev-$CUDA_PKG_VERSION \
            cuda-npp-dev-$CUDA_PKG_VERSION \
            cuda-cudart-dev-$CUDA_PKG_VERSION \
            cuda-driver-dev-$CUDA_PKG_VERSION \
            cuda-samples-$CUDA_PKG_VERSION \
            # bonsai and friends
            cmake \
            cuda-runtime-7-5 \
            cuda-7-5 \
            freeglut3-dev \
            qt-sdk \
            libqt5webkit5-dev \
            x11-xserver-utils \
            compton \
            # gaia sky
            #default-jre \
            #default-jdk \
            oracle-java8-installer=8u151-1~webupd8~0 \
            oracle-java8-set-default \
            # convencience and debugging
            nano \
            vim \
            x11-apps \
            dstat \
            bash-completion \
            x11-utils \
            strace \
            usbutils \
            joystick \
            jstest-gtk \
    # cuda_runtime
    && ln -s cuda-7.5 /usr/local/cuda \
    && echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/cuda.conf \
    && ldconfig \
    # cuda_devel
    && cd /tmp && apt-get download gpu-deployment-kit \
    && mkdir /tmp/gpu-deployment-kit && cd /tmp/gpu-deployment-kit \
    && dpkg -x /tmp/gpu-deployment-kit_*.deb . \
    && mv usr/include/nvidia/gdk/* /usr/local/cuda/include \
    && mv usr/src/gdk/nvml/lib/* /usr/local/cuda/lib64/stubs \
    && rm -rf /tmp/gpu-deployment-kit*
    # no cleanup
    # && /usr/local/bin/clean.sh

# 2nd cache (merge into above later!)
#RUN /usr/local/bin/update.sh \
#    && /usr/local/bin/install.sh \
#            # general:
#    #&& /usr/local/bin/clean.sh
#    && echo DONE

RUN pip2 install --upgrade pip virtualenv setuptools \
    && pip3 install --upgrade pip virtualenv setuptools

COPY setup-venv.sh /usr/local/bin/

    # pre-install virtual environment for kivy and several other packages
RUN setup-venv.sh \
    #
    # java & gaia sky
    # ...
    && echo "DONE."

COPY venv-python.sh /usr/local/bin/
COPY touchtracer /usr/local/bin/
COPY kivy_config.ini /root/.kivy/config.ini

CMD ["/usr/local/bin/touchtracer"]


ARG IMAGE_VERSION=latest
ARG GIT_NOT_CLEAN_CHECK
ARG BUILD_DATE=unknown
ARG VCS_REF=unknown
ARG VCS_URL=unknown
ARG DOCKERFILE=unknown

LABEL maintainer="Volker Gaibler <volker.gaibler@h-its.org>" \
    org.label-schema.name="hitsfat" \
    org.label-schema.description="fat base image usable for various interactive applications for the ESO Supernova" \
    org.label-schema.vendor="HITS gGmbH" \
    org.label-schema.vcs-ref="${VCS_REF}" \
    org.label-schema.vcs-url="${VCS_URL}" \
    org.label-schema.version="${VCS_VERSION}" \
    org.label-schema.build-date="${BUILD_DATE}" \
    org.label-schema.schema-version="1.0" \
    IMAGE_VERSION="${IMAGE_VERSION}" \
    GIT_NOT_CLEAN_CHECK="${GIT_NOT_CLEAN_CHECK}" \
    DOCKERFILE="${DOCKERFILE}"


