#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Downloading package"
wget https://telegram.org/dl/desktop/linux

echo "Extracting Telegram"
tar -xzf pycharm-community-2020.2.2.tar.gz

echo "Moving Telegram folder to /opt directory"
mv Telegram/ /opt/

echo "Entering opt/"
cd /opt/

echo "Entering Telegram folder"
cd Telegram/

echo "Creating hard link"
ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop

echo "Launching Telegram"
telegram-desktop