#!/bin/bash 

apt-get -y update
apt-get -y upgrade
apt-get install -y \
    build-essential \
    git-core \
    python \
    python-pip \
    libffi-dev \
    libssl-dev 

pip install --upgrade pip
pip install  \
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

cd ./ansible
source ./hacking/env-setup

bin/ansible-playbook -K -i , ../provision.yml
stow -t ${HOME} dotfiles
