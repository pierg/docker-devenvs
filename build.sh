#!/bin/bash

main() {

    local devenv=${1?Need command}

    case "${devenv}" in

        base | pybullet)
            docker build -f ./dockerfiles/${devenv}.dockerfile -t pmallozzi/devenvs:${devenv} --no-cache .
            ;;
        *)
            echo "Unknown command: ${cmd}"
            ;;
    esac
}

main $@
