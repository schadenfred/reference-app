#!/bin/sh

dcd

. mise/scripts/docker-prune-club.sh 
# . mise/scripts/docker-prune-all.sh 

dc build --with-dependencies builder-development
dc up 