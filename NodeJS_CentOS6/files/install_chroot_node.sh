#!/bin/bash

# Source:
# https://nodejs.org/en/download/package-manager/#enterprise-linux-and-fedora

curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
yum -y install nodejs
echo
node --version
echo
/sbin/ifconfig
echo
echo ###################
echo 
[[ -f /index.js ]] && node /index.js
