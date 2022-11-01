FROM pmallozzi/devenvs:base-gui-38

RUN pip install gym

RUN pip install stable_baselines3

RUN pip install pybullet

# Create Mujoco subdir.
RUN mkdir /home/headless/.mujoco

RUN mkdir /root/.mujoco

# Download and install mujoco.
RUN wget https://mujoco.org/download/mujoco210-linux-x86_64.tar.gz
RUN tar -xf mujoco210-linux-x86_64.tar.gz -C /home/headless/.mujoco
RUN tar -xf mujoco210-linux-x86_64.tar.gz -C /root/.mujoco
RUN rm mujoco210-linux-x86_64.tar.gz

# Add LD_LIBRARY_PATH environment variable.
ENV LD_LIBRARY_PATH "/home/headless/.mujoco/mujoco210/bin:${LD_LIBRARY_PATH}"
RUN echo 'export LD_LIBRARY_PATH=/home/headless/.mujoco/mujoco210/bin:${LD_LIBRARY_PATH}' >> /etc/bash.bashrc

ENV LD_LIBRARY_PATH "/root/.mujoco/mujoco210/bin:${LD_LIBRARY_PATH}"
RUN echo 'export LD_LIBRARY_PATH=/root/.mujoco/mujoco210/bin:${LD_LIBRARY_PATH}' >> /etc/bash.bashrc

# Finally, install mujoco_py.
RUN pip install mujoco_py

RUN apt install python3.8-dev

