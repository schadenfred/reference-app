#!/bin/sh

dcd

. mise/scripts/docker.prune.sh 
. mise/scripts/docker.info.sh 
# . mise/scripts/docker-prune-all.sh 

dc build --with-dependencies builder-development