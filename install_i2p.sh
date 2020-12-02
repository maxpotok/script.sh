#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Adding i2p PPA"
apt-add-repository ppa:i2p-maintainers/i2p

echo "Updating packages"
apt get update

echo "Installing i2p"
apt-get install i2p