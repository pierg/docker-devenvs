# Docker Dev-envs

## How to run an image

Choose a docker image tag, e.g. `base-gui-gymphysics-310`

```bash
./docker_run.sh base-gui-gymphysics-310
```

### Interact via GUI

Navigate to [http://localhost:6901/vnc.html](http://localhost:6901/vnc.html), password: `headless`



### Interact via command line


```bash
./docker_enter.sh base-gui-gymphysics-310
```

To exit the container enter:

```bash
exit
```


### Interact via ssh

You can connect via ssh 

```bash
ssh -p 9922 root@localhost
```

and enter the password `password`

### Use it as remote development environment

You can set up your python interpreter to be the one running in the docker container via the SSH connection

See instructions for [PyCharm](https://www.jetbrains.com/help/pycharm/configuring-remote-interpreters-via-ssh.html) and [VSCode](https://code.visualstudio.com/docs/remote/ssh-tutorial).