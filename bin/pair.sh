#!/bin/bash

if [ "$1" == "cleanup" ] ; then
  ps aux | grep "ssh.*tunnel" | grep -v "grep" | awk '{print $2}' | xargs kill
  exit
fi

if [ "$1" == "host" ] ; then
  ssh -NC2f tunnel_from_remote
  exit
fi

# join
ssh -NC2f tunnel_to_pair_via_remote
ssh pair_via_remote

