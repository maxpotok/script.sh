#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

version="2020.2.2"
url="https://download.jetbrains.com/python/pycharm-community-$version.tar.gz"

echo "Downloading package"
#wget $url

echo "Moving Pycharm folder to /opt directory"
mv pycharm-community-$version.tar.gz /opt/

echo "Entering opt/"
cd /opt/

echo "Extracting PyCharm"
tar -xzf pycharm-community-$version.tar.gz

echo "Entering Pycharm folder"
cd pycharm-community-$version/

echo "Entering bin"
cd bin

echo "Installing PyCharm"
sh pycharm.sh
