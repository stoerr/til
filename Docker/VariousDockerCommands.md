# Various Docker commands

Created 29-08-2023, last change 29-08-2023

This contains various common commands for the 
[Docker command line](https://docs.docker.com/engine/reference/commandline/cli/)
which I tend to use often. So this is my central point to look them up.

## Docker Cleanup

docker system prune --volumes
docker volume prune
docker image prune -a

## Status

docker stats -a
docker ps -a

## Run

Command line in an container without network access and mount the current directory as work directory:
docker run -ti --rm --network none -v `pwd`:`pwd` -w `pwd` -p 8080:8080 openjdk:12-jdk /bin/bash

## Inspect image

show Dockerfiles : 
docker image history --no-trunc <img>
docker run -it --entrypoint /bin/bash --rm -u root <img>

docker export $(docker ps -lq) | tar tf -
docker create --name="tmp_$$" image:tag ; docker export tmp_$$ | tar t ; docker rm tmp_$$

## Arguments

On Mac M1: --platform linux/x86_64/v8
or use e.g. https://hub.docker.com/r/arm64v8/openjdk/

environment variable DOCKER_DEFAULT_PLATFORM
linux/x86_64/v8 versus linux/arm64/v8
