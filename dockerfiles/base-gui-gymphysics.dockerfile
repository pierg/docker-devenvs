FROM pmallozzi/devenvs:base-gui

USER root
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    libgl1-mesa-dev \
    libgl1-mesa-glx \
    libglew-dev \
    libosmesa6-dev \
    net-tools \
    vim \
    virtualenv \
    wget \
    xpra \
    xserver-xorg-dev \
    libglfw3-dev \
    patchelf