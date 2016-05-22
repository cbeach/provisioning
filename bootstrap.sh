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

color_echo yellow "Bootstrapping your system..."
color_echo green "Updating apt-get..."
apt-get update -y
color_echo green "Upgrading system..."
apt-get upgrade -y
color_echo green "Installing git..."
apt-get install -y git-core

color_echo green "Creating development directory..."
mkdir dev
cd dev
color_echo green "Cloning the profisioning repository..."
git clone https://github.com/cbeach/provisioning.git
cd provisioning
git submodule update --init --recursive

color_echo green "Running the provisioning script..."
. setup.sh
