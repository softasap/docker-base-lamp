#!/bin/sh
if [ -z $1 ]
then
  TAG=":master"
else
  TAG=":$1"
fi
echo docker push voronenko/base-lamp$TAG
docker push voronenko/base-lamp$TAG
