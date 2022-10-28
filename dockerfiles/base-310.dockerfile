FROM ubuntu:20.04

USER root
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    gcc \
    unzip \
    cmake \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install python3.10.
RUN apt-get update && apt-get install -y software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get install python3.10 -y

# Make python3.10 the default python.
RUN rm /usr/bin/python3
RUN ln -s /usr/bin/python3.10 /usr/bin/python3
RUN ln -s /usr/bin/python3.10 /usr/bin/python
RUN apt-get install python3-distutils -y

# Install pip.
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN rm get-pip.py

# Install pdm.
RUN curl -sSL https://raw.githubusercontent.com/pdm-project/pdm/main/install-pdm.py | python3 -
RUN export PATH=${HOME}/.local/bin:${PATH}
RUN echo "export PATH=${HOME}/.local/bin:${PATH}" >> ~/.bashrc
#RUN pdm config python.use_venv false
#RUN pdm --pep582 >> ~/.bash_profile

# Setup SSH with secure root login
RUN apt-get update \
 && apt-get install -y openssh-server netcat \
 && mkdir /var/run/sshd \
 && echo 'root:password' | chpasswd \
 && sed -i 's/\#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]