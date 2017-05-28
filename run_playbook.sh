#!/bin/bash 

source lib.sh

color_echo red "[warn] Assuming that Ansible has already been cloned"

color_echo green "Starting ansible run"
cd ./ansible
color_echo green "Setting up ansible environment"

source ./hacking/env-setup

color_echo green "Running ansible playbook"

bin/ansible-playbook -K -i , ../provision.yml
