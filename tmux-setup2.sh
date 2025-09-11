#!/bin/bash

echo "---"
echo "[+] Starting setup process..."
echo "---"

sleep 2
echo " "
echo "[+] Copying files to home directory..."
echo " "
cd ~/tmux-setup
cp -r .termux fastfetch OneShot-C ~/ || { echo "[-] Failed to copy tmux files."; exit 1; }
echo "[✓] Files copied successfully."

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
cd ~/ && rm -rf Termux-zsh

sleep 2

echo " "
echo "[✓] Done."

sleep 1
