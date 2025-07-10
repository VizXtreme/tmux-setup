#!/bin/bash

# Update and upgrade Termux packages, then install necessary tools

# Automatically input 'N' for configuration prompts during upgrade

apt update && apt upgrade -o Dpkg::Options::="--force-confold" -y
pkg install python git wget curl openssh figlet make tsu x11-repo -y

# Clone the Termux-zsh repository, navigate into it, and run the setup script with automated 'Y' input

git clone https://github.com/Sohil876/Termux-zsh.git
cd Termux-zsh || exit # Exit if cd fails
yes 1 | bash setup.sh
