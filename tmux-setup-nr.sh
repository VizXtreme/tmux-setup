#!/bin/bash

echo "---"
echo "[+] Starting setup process for non-root users..."
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
echo "[+] Cleaning up..."
cd ~/ && rm -rf Termux-zsh OneShot-C

sleep 2

echo " "
echo "[✓] Done."

sleep 1
