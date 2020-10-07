#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Updating packages"
apt-get update

echo "Downloading packages"
apt-get install dirmngr gpg-agent apt-transport-https

echo "Importing GPG key"
apt-key adv --keyserver hkps://keys.openpgp.org --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E

echo "Creating weechat.list"
echo "deb https://weechat.org/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/weechat.list

echo "Updating packages"
apt-get update

read -p "Would you like to get to get additional plugins (curses/python/perl)?" pick

if ["$pick" -eq "n"]; then
	apt-get install weechat-plugins
else
	apt-get install weechat-curses weechat-plugins weechat-python weechat-perl
fi