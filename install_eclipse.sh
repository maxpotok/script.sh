#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

package="eclipse-inst-jre-linux64.tar.gz"
url="https://ftp.snt.utwente.nl/pub/software/eclipse/oomph/epp/2020-09/R/eclipse-inst-jre-linux64.tar.gz"

echo "Updating packages"
apt-get update

echo "Installing JRE"
apt-get install default-jre

echo "Setting default Java environment"
apt-get install oracle-java8-set-default

echo "Downloading Eclipse"
wget $url

echo "Moving Eclipse archive to /opt directory"
mv $package /opt/

echo "Entering opt/"
cd /opt/

echo "Extracting Eclipse"
tar -xzf $package

echo "Enter eclipse-installer folder"
cd eclipse-installer

echo "Launching installation process"
./eclipse-inst
