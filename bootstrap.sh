#!/bin/bash 

source lib.sh


color_echo yellow "Bootstrapping your system..."
color_echo green "Updating apt-get..."
apt-get update -y
color_echo green "Upgrading system..."
apt-get upgrade -y
color_echo green "Installing git..."
apt-get install -y git-core

color_echo green "Creating development directory..."
mkdir dev
cd dev
color_echo green "Cloning the profisioning repository..."
git clone https://github.com/cbeach/provisioning.git
cd provisioning
git submodule update --init --recursive

color_echo green "Running the provisioning script..."
. setup.sh
