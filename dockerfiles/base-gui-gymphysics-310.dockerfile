FROM pmallozzi/devenvs:base-gui-gymphysics

# Install python3.10.
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
RUN pip install -U pip setuptools wheel
RUN pip install pdm