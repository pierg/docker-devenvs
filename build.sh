#!/bin/bash

main() {

    local devenv=${1?Need command}

    case "${devenv}" in

        base-gui | base-gui-38 | base-gui-38-gymphysics )
            docker build -f ./dockerfiles/${devenv}.dockerfile -t pmallozzi/devenvs:${devenv} . --no-cache
            ;;
        all )
            docker build -f ./dockerfiles/base-gui.dockerfile -t pmallozzi/devenvs:base-gui --no-cache .
            docker build -f ./dockerfiles/base-gui-38.dockerfile -t pmallozzi/devenvs:base-gui-38 --no-cache .
            docker build -f ./dockerfiles/base-gui-38-gymphysics.dockerfile -t pmallozzi/devenvs:base-gui-38-gymphysics --no-cache .
            ;;
        *)
            echo "Unknown command: ${cmd}"
            ;;
    esac
}

main $@
