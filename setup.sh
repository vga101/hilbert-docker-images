#!/bin/bash

U=malex984
I=dockapp

docker pull phusion/baseimage:0.9.16

#docker tag phusion/baseimage:0.9.16 "$U/$I:base"


docker images -a
docker ps -a -s

# ALL: base dd main appa menu alsa xeyes gui play iceweasel skype q3 x11 cups ;

# for dependencies please check out depsgen.sh!
for d in base dd main menu appa alsa xeyes test cups x11 gui play iceweasel skype q3 ;
do
  echo
  echo "Building $d -> $U/$I:$d...."
  cat "$d/Dockerfile"
  echo
  docker ps -sa | grep "$d"
  # docker stop "$d"
  # docker rm -f "$d"

  docker build --pull=false --force-rm=true --rm=true -t "$U/$I:$d" "$d" || exit 1

  echo
#  docker push "$U/$I:$d"
done

docker rmi $(docker images -q -f dangling=true)

docker images -a
docker ps -a
