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

echo " "
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

sleep 2

echo "[+] Reloading termux settings..."
termux-reload-settings
clear

sleep 2

cd ~/tmux-setup

# Ask user about root status with proper input validation
while true; do
    read -p "[+] Is your device rooted? (yes/no): " answer
    
    # Remove leading/trailing whitespace
    answer=$(echo "$answer" | xargs)
    
    # Check if input is empty (blank spaces)
    if [[ -z "$answer" ]]; then
        echo "[-] Error: Input cannot be blank. Please answer 'yes' or 'no'."
        continue
    fi
    
    # Convert to lowercase for case-insensitive comparison
    answer_lower=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
    
    case $answer_lower in
        y|yes)
	    echo " "
	    echo "[+] Running setup for root users..."
            echo " "
	    bash tmux-setup-r.sh
            break
            ;;
        n|no)
	    echo " "
            echo "[+] Running setup for non-root users..."
            echo " "
	    bash tmux-setup-nr.sh
            break
            ;;
        *)
            echo "[-] Invalid input. Please answer 'yes' or 'no'."
            ;;
    esac
done

echo " "
echo "[✓] Setup completed successfully!"
echo " "

sleep 1

echo "[+] Cleaning up..."
cd ~/ && mkdir sh_bak && mv tmux-setup/tmux* sh_bak/ && rm -rf Termux-zsh tmux-setup

sleep 1

echo "[✓] Relaunch Termux..."

exit
