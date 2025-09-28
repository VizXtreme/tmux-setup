#!/bin/bash

echo "---"
echo "[+] Starting setup process..."
echo "---"

sleep 2
echo " "
echo "[+] Moving files to home directory..."
echo " "
cd ~/tmux-setup
mv -r .termux OneShot-C ~/ || { echo "[-] Failed to move files."; exit 1; }
echo "[✓] Files moved successfully."

sleep 2

echo " "
echo "[+] Installing OneShot dependencies..."
echo " "
pkg install -y root-repo
pkg install -y wpa-supplicant pixiewps iw openssl || { echo "[-] Failed to install OneShot dependencies."; exit 1; }
echo "[✓] OneShot dependencies installed."

sleep 2

echo " "
echo "[+] Compiling OneShot..."
echo " "

sleep 2

cd $HOME/OneShot-C && make && chmod +x oneshot || { echo "[-] Failed to compile OneShot-C."; exit 1; }
echo "[✓] Compiled OneShot successfully (ignore the warnings)."

sleep 2

echo " "
echo "[+] Cleaning up..."
cd ~/ && mkdir sh_bak && mv tmux-setup/tmux* sh_bak/ && rm -rf Termux-zsh tmux-setup

sleep 2

echo " "
echo "[✓] Done."
echo " "

sleep 1
