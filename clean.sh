docker ps -aq | xargs docker stop | xargs docker rm
docker system prune -a -f