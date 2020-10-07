#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Downloading package"
wget https://download.jetbrains.com/python/pycharm-community-2020.2.2.tar.gz

echo "Extracting PyCharm"
tar -xzf pycharm-community-2020.2.2.tar.gz

echo "Moving Pycharm folder to /opt directory"
mv pycharm-community-2020.2.2/ /opt/

echo "Entering opt/"
cd /opt/

echo "Entering Pycharm folder"
cd pycharm-community-2020.2.2/

echo "Entering bin"
cd bin

echo "Installing PyCharm"
sh pycharm.sh