#!/bin/bash

main() {

  local container=${1?Need command}

  docker exec \
    -it \
    $container \
    bash
}

main $@
