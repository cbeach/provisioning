#!/bin/bash 

source lib.sh

color_echo yellow "current working directory: $(pwd)"

color_echo yellow "Bootstrapping your system..."
apt-get -y update
apt-get -y upgrade
color_echo green "Installing required system packages..."
apt-get install -y \
    build-essential \
    git \
    python \
    python-pip \
    libffi-dev \
    stow \
    libssl-dev 

color_echo green "Installing required python packages..."
pip3 install --upgrade pip
pip3 install  \
     bpytop \
     powerline-shell \
     paramiko \
     PyYAML \
     Jinja2 \
     httplib2 \
     six \
     nose \
     passlib \
     pycrypto \
     virtualenv \
     virtualenvwrapper

source painfull_installs.sh

color_echo green "Starting ansible run"
cd ./ansible
color_echo green "Setting up ansible environment"
source ./hacking/env-setup

bin/ansible-playbook -vvvv -K -i , ../provision.yml
cd ../
rm ${HOME}/.bashrc
#./install-apt-vim.sh
stow -t ${HOME} dotfiles
#./install-vim-packages.sh
