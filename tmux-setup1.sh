#!/bin/bash

echo "---"
echo "[+] Starting setup process..."
echo "---"

# Update and upgrade Termux packages, then install necessary tools & automatically input 'N' for configuration prompts during upgrade.

echo " "
echo "[+] Updating Termux packages..."
echo " "
apt update && apt upgrade -o Dpkg::Options::="--force-confold" -y
pkg install python clang git gh wget curl openssh figlet make tsu x11-repo fastfetch toilet sl cmatrix cowsay fortune -y || { echo "[-] Failed to update."; exit 1; }
echo "[✓] Updated successfully."

sleep 2

# Clone the Termux-zsh repository, navigate into it, and run the setup script with automated 'Y' input

echo " "
echo "[+] Cloning repository..."
echo " "
git clone https://github.com/VizXtreme/Termux-zsh.git || { echo "[-] Failed to clone repository."; exit 1; }

sleep 2

echo " "
echo "[+] Starting Termux-zsh setup..."
echo " "
sleep 2
cd Termux-zsh
yes 1 | bash setup.sh
