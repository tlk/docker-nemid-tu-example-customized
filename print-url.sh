#!/bin/sh

BOOT2DOCKER=$(which boot2docker)
if [ $? = "0" ]; then
  echo http://$($BOOT2DOCKER ip):8080
else
  echo http://$(hostname):8080
fi
