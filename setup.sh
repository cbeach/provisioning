#!/bin/bash 

apt-get update
apt-get upgrade
apt-get install git-core python python-pip
pip install --upgrade pip
pip install paramiko PyYAML Jinja2 httplib2 six nose passlib pycrypto virtualenv virtualenvwrapper
git clone git://github.com/ansible/ansible.git --recursive

cd ./ansible
source ./hacking/env-setup

bin/ansible-playbook -K -i , ../provision.yml
