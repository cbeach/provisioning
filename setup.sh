#!/bin/bash 

apt-get update
apt-get upgrade
apt-get install git-core python python-pip
pip install --upgrade pip
pip install paramiko PyYAML Jinja2 httplib2 six nose passlib pycrypto virtualenv virtualenvwrapper

cd ./ansible
source ./hacking/env-setup

bin/ansible-playbook -K -i , ../provision.yml
