#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Updating packages"
apt-get update

echo "Installing Node.js basic version"
apt-get install nodejs

echo "Installing npm"
apt-get install npm

echo "Cleaning cache"
npm cache clean -f

echo "Checking for global node version"
npm install -g n

echo "Installing latest node version"
n latest
