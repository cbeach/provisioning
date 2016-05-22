#!/bin/bash 
# run this script with the command 

apt-get update
apt-get upgrade
apt-get install git-core

mkdir dev
cd dev
git clone https://github.com/cbeach/provisioning.git
cd provisioning

. setup.sh
