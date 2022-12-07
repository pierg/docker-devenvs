FROM pmallozzi/devenvs:base-gui

# Install python3.9.
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get install python3.9 -y

# Make python3.9 the default python.
RUN rm /usr/bin/python3
RUN ln -s /usr/bin/python3.9 /usr/bin/python3
RUN ln -s /usr/bin/python3.9 /usr/bin/python
RUN apt-get install python3-distutils -y

# Install pip.
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN rm get-pip.py