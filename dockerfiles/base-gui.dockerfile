FROM accetto/ubuntu-vnc-xfce-opengl-g3:chromium

USER root
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    git \
    build-essential \
    gcc \
    unzip \
    cmake

# Setup SSH with secure root login
RUN apt-get update \
 && apt-get install -y openssh-server netcat \
 && mkdir /var/run/sshd \
 && echo 'root:password' | chpasswd \
 && sed -i 's/\#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]