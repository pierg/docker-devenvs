#!/bin/bash

function build_and_load(){
  docker buildx build --platform linux/amd64,linux/arm64 -f ./dockerfiles/${1}.dockerfile -t pmallozzi/devenvs:${1} --push . --no-cache
  docker buildx build --load -t pmallozzi/devenvs:${1} .
}

main() {

    local devenv=${1?Need command}

    case "${devenv}" in

        base-gui | base-gui-gymphysics | base-gui-gymphysics-310 )
            build_and_load "$1"
            ;;
        all310 )
            build_and_load "base-gui"
            build_and_load "base-gui-gymphysics"
            build_and_load "base-gui-gymphysics-310"
            ;;
        *)
            echo "Unknown command: ${cmd}"
            ;;
    esac
}

main $@
