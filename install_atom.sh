#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

version="deb"
url="https://atom.io/download/deb"

echo "Downloading package"
wget $url

echo "Installing Atom"
dpkg -i $version

echo "Installing Atom's dependencies if they are missing"
apt-get -f install