#!/bin/sh

BOOT2DOCKER=$(which boot2docker)
if [ $? = "0" ]; then
  echo open http://$($BOOT2DOCKER ip):8080
fi
