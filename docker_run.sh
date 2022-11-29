#!/bin/bash

port_ssh=9922
port_vnc=6901
repo_dir="$(pwd)"

my_platform=""
case $(uname -m) in
    x86_64 | i686 | i386) my_platform="linux/amd64" ;;
    arm64)    my_platform="linux/arm64" ;;
esac
echo ${my_platform}


cleanup() {
  echo "Checking if container already exists.."
  if [[ $(docker ps -a --filter="name=$container" --filter "status=running" | grep -w "$container") ]]; then
    docker stop $container
    docker rm $container
    echo "Cleaning up..."
  elif [[ $(docker ps -a --filter="name=$container") ]]; then
    docker rm $container || true
    echo "Cleaning up..."
  else
    echo "No existing container found"
  fi
}

main() {

  local version=${1?Need command}
  container=${version}
  image=pmallozzi/devenvs:${version}

  docker pull ${image}

  mount_arg="-v ${repo_dir}:/root/host"
  port_arg="-p $port_vnc:6901 -p $port_ssh:22"

  which docker 2>&1 >/dev/null
  if [ $? -ne 0 ]; then
    echo "Error: the 'docker' command was not found.  Please install docker."
    exit 1
  fi

  cleanup

  echo "Navigate to http://localhost:6901"
  echo "Lite VNC http://localhost:6901/vnc_lite.html"
  echo "Full VNC http://localhost:6901/vnc.html"

  docker run \
    -d \
    --name $container \
    --privileged \
    --workdir /root/host \
    --platform ${my_platform} \
    ${mount_arg} \
    ${port_arg} \
    $image

}

main "$@"
