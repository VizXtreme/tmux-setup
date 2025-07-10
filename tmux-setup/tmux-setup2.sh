#!/bin/bash
set -e

# Optional: ensure git is installed
command -v git >/dev/null 2>&1 || {
  echo "[+] Installing git..."
  pkg install -y git
}

# GitHub repository URL
REPO_URL="https://github.com/yourusername/yourrepo.git"

# Temporary directory for clone
TMP_DIR=$(mktemp -d)

echo "[+] Cloning repository..."
git clone "$REPO_URL" "$TMP_DIR"

echo "[+] Copying files to ~/"
cp -a "$TMP_DIR"/. ~/

echo "[+] Cleaning up..."
rm -rf "$TMP_DIR"

echo "[+] Installing OneShot dependencies..."
pkg install -y root-repo git tsu python wpa-supplicant pixiewps iw openssl

echo "[+] Compiling OneShot..."
cd ~/OneShot-C && make

clear

echo "[✓] Done. Exiting Termux."

sleep 2

exit
