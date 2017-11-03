FROM hilbert/kiosk

LABEL maintainer "Volker Gaibler <volker.gaibler@h-its.org>"

# add cuda repository, taken from hilbert-docker-images/images/cuda_runtime/Dockerfile
RUN NVIDIA_GPGKEY_SUM=d1be581509378368edeec8c1eb2958702feedf3bc3d17011adbf24efacce4ab5 && \
    NVIDIA_GPGKEY_FPR=ae09fe4bbd223a84b2ccfce3f60f4b3d7fa2af80 && \
    apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/7fa2af80.pub && \
    apt-key adv --export --no-emit-version -a $NVIDIA_GPGKEY_FPR | tail -n +2 > cudasign.pub && \
    echo "$NVIDIA_GPGKEY_SUM  cudasign.pub" | sha256sum -c --strict - && rm cudasign.pub && \
    echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64 /" > /etc/apt/sources.list.d/cuda.list
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
            # bonsai
            cmake \
            cuda-runtime-7-5 \
            cuda-7-5 \
            freeglut3-dev \
            # gaia sky
            default-jre \
            default-jdk \
            # convencience
            nano \
            vim \
            x11-apps \
            dstat \
            bash-completion \
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
    #&& rm -rf /tmp/gpu-deployment-kit* \
    # cleanup
    && /usr/local/bin/clean.sh


RUN pip2 install --upgrade pip virtualenv setuptools \
    && pip3 install --upgrade pip virtualenv setuptools

COPY setup-venv.sh /opt/admin/


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

