#!/bin/bash
set -e

get_commit_count() {
  git rev-list --all --count
}

source secrets/docker-hub.env
echo "> Logging docker hub with user: ${DOCKER_USERNAME}"

echo "${DOCKER_PASSWORD}" | \
docker login --username="${DOCKER_USERNAME}" --password-stdin

echo "> Pushing image to docker hub..."
docker tag git-crypt:latest sunzhongmou/git-crypt:latest
docker push sunzhongmou/git-crypt:latest

docker tag sunzhongmou/git-crypt:latest "sunzhongmou/git-crypt:$(get_commit_count)"
docker push "sunzhongmou/git-crypt:$(get_commit_count)"