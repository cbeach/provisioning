#!/bin/bash 

source lib.sh

color_echo yellow "current working directory: $(pwd)"

color_echo yellow "Bootstrapping your system..."
sudo apt-get -y update
sudo apt-get -y upgrade
color_echo green "Installing required system packages..."
sudo apt-get install -y \
    build-essential \
    git \
    python \
    python3-pip \
    libffi-dev \
    stow \
    libssl-dev 

color_echo green "Installing required python packages..."
sudo pip3 install --upgrade pip
sudo pip3 install  \
     ansible \
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

color_echo green "Starting ansible run"
ansible-playbook -vvvv -K -i , ./provision.yml
rm ${HOME}/.bashrc
stow -t ${HOME} dotfiles
./install-apt-vim.sh
./install-vim-packages.sh
