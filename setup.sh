#!/bin/bash 

pip install paramiko PyYAML Jinja2 httplib2 six nose passlib pycrypto
git clone git://github.com/ansible/ansible.git --recursive

cd ./ansible
source ./hacking/env-setup

bin/ansible-playbook -K -i , ../provision.yml
