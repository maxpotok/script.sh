#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

version="0.0.12"
url="https://discord.com/api/download?platform=linux&format=deb"

echo "Updating packages"
apt-get update

if [ $(dpkg-query -W -f='${Status}' gdebi-core 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo "Installing gdebi-core"
  apt-get install gdebi-core;
fi

echo "Downloading discord .deb file"
wget $url

echo "Installing discord"
gdebi "download?platform=linux&format=deb"

echo "Launching discord"
discord --no-sandbox