#!/bin/bash 

color_echo() {
    color=$1
    text=$2
    case $color in
        black)
            echo -e "\033[0;30m${text}\033[0m"
            ;;
        red)
            echo -e "\033[0;31m${text}\033[0m"
            ;;
        green)
            echo -e "\033[0;32m${text}\033[0m"
            ;;
        brown)
            echo -e "\033[0;33m${text}\033[0m"
            ;;
        blue)
            echo -e "\033[0;34m${text}\033[0m"
            ;;
        purple)
            echo -e "\033[0;35m${text}\033[0m"
            ;;
        cyan)
            echo -e "\033[0;36m${text}\033[0m"
            ;;
        light_gray)
            echo -e "\033[0;37m${text}\033[0m"
            ;;
        dark_gray)
            echo -e "\033[1;30m${text}\033[0m"
            ;;
        light_red)
            echo -e "\033[1;31m${text}\033[0m"
            ;;
        light_green)
            echo -e "\033[1;32m${text}\033[0m"
            ;;
        yellow)
            echo -e "\033[1;33m${text}\033[0m"
            ;;
        light_blue)
            echo -e "\033[1;34m${text}\033[0m"
            ;;
        light_purple)
            echo -e "\033[1;35m${text}\033[0m"
            ;;
        light_cyan)
            echo -e "\033[1;36m${text}\033[0m"
            ;;
        white)
            echo -e "\033[1;37m${text}\033[0m"
            ;;
        *)
            echo -e "\033[0;31m${color} is not a valid color\033[0m"
            ;;
    esac
}

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
    libssl-dev 

color_echo green "Installing required python packages..."
pip install --upgrade pip
pip install  \
    stow \
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
stow -t ${HOME} dotfiles
