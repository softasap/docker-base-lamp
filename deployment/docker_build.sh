#!/bin/sh
# do docker build --no-cache to drop cached parts
if [ -z $1 ]
then
  TAG=":master"
else
  TAG=":$1"
fi
echo docker build --tag="voronenko/base-lamp$TAG" ../
docker build --tag="voronenko/base-lamp$TAG" ../

echo "Successfully built voronenko/base-lamp$TAG"

