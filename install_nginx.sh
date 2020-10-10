#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Updating packages"
apt-get update

echo "Installing nginx"
apt-get install nginx

echo "Adjusting the Firewall"
ufw app list
ufw allow "Nginx HTTP"
ufw status

echo "Checking Web Server"
systemctl status nginx
firefox localhost