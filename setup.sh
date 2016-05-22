#!/bin/bash 

apt-get -y update
apt-get -y upgrade
apt-get install -y git-core python python-pip
pip install --upgrade pip
pip install paramiko PyYAML Jinja2 httplib2 six nose passlib pycrypto virtualenv virtualenvwrapper

cd ./ansible
source ./hacking/env-setup

stow -t ${HOME} dotfiles
bin/ansible-playbook -K -i , ../provision.yml
