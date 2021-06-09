#!/usr/bin/env bash

set -eu

docker_username="${1:-}"
docker_password="${2:-}"
version="${3:-}"

cd maven-3.8.1-openjdk-11

echo "${docker_password:?}" | docker login -u "${docker_username:?}" --password-stdin

docker build -t "uribarri/maven-spring-ready:$version" -t "uribarri/maven-spring-ready:latest"  .

docker push "uribarri/maven-spring-ready:$version"
docker push "uribarri/maven-spring-ready:latest"
