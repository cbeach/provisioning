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

#source painfull_installs.sh

color_echo green "Setting up ansible environment"

ansible-playbook -vvvv -K -i , provision.yml
cd ../
rm -f ${HOME}/.bashrc
#./install-apt-vim.sh
stow -t ${HOME} dotfiles
#./install-vim-packages.sh
