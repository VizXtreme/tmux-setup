#!/bin/bash

echo "---"
echo "[+] Starting setup process for non-root users..."
echo "---"

sleep 2

echo " "
echo "[+] Moving files to home directory..."
echo " "
cd ~/tmux-setup
mv -r .termux ~/ || { echo "[-] Failed to move files."; exit 1; }
echo "[✓] Files moved successfully."

sleep 2

echo " "
echo "[✓] Done."
echo " "

sleep 1
