#!/bin/bash 

apt-get update -y
apt-get upgrade -y
apt-get install -y git-core

mkdir dev
cd dev
git clone https://github.com/cbeach/provisioning.git
cd provisioning

. setup.sh
