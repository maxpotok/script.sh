#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

version="2.4.3"
url="https://telegram.org/dl/desktop/linux/tsetup.$version.tar.xz"

echo "Downloading package"
wget $url

echo "Moving Telegram folder to /opt directory"
mv tsetup.$version.tar.xz /opt/

echo "Entering opt/"
cd /opt/

echo "Extracting Telegram"
tar -xzf tsetup.$version.tar.xz

echo "Entering Telegram folder"
cd Telegram/

echo "Creating hard link"
ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop

echo "Launching Telegram"
telegram-desktop
