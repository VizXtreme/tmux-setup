#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# List of useful Termux packages.
packages=(
    "binutils"
    "clang"
    "cmake"
    "coreutils"
    "curl"
    "fish"
    "figlet"
    "gdb"
    "git"
    "golang"
    "htop"
    "make"
    "mariadb"
    "nano"
    "net-tools"
    "nmap"
    "nodejs"
    "openjdk-17"
    "openssh"
    "perl"
    "php"
    "postgresql"
    "procps"
    "python"
    "ruby"
    "rust"
    "sqlite"
    "termux-api"
    "tmux"
    "tsu"
    "vim"
    "wget"
    "zsh"
)

# Fancy header
echo -e "${CYAN}"
echo "========================================"
echo "     🚀 Termux Package Installer 🚀"
echo "              By VizXtreme"
echo "========================================"
echo -e "${NC}"

# Display menu
echo -e "${YELLOW} 0.${NC} Install ALL packages${NC}"
for i in "${!packages[@]}"; do
    printf "${YELLOW}%2d.${NC} %s\n" $((i+1)) "${packages[$i]}"
done
echo ""
echo "----------------------------------------"
echo ""

# Ask user input
echo -ne "${CYAN}Enter package numbers (e.g., 1,4,6) or 0 for ALL (press CTRL then D to terminate the installation):${NC} "
read choices
echo ""

if [[ "$choices" == "0" ]]; then
    echo -e "${GREEN}Installing all packages...${NC}"
    pkg install -y "${packages[@]}"
else
    IFS=',' read -ra selected <<< "$choices"

    for choice in "${selected[@]}"; do
        index=$((choice-1))
        if [[ $index -ge 0 && $index -lt ${#packages[@]} ]]; then
            echo -e "${GREEN}Installing:${NC} ${packages[$index]}"
            pkg install -y "${packages[$index]}"
        else
            echo -e "${RED}Invalid choice:${NC} $choice"
        fi
    done
fi
