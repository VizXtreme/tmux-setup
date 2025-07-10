#!/bin/bash
#set -e

# Optional: ensure git is installed
command -v git >/dev/null 2>&1 || {
  echo "[+] Installing git..."
  pkg install -y git
}

# GitHub repository URL
REPO_URL="https://github.com/VizXtreme/tmux-setup.git"

# Temporary directory for clone
TMP_DIR=$(mktemp -d)

echo "---"
echo "[+] Starting setup process..."
echo "---"

echo "[+] Cloning repository..."
git clone "$REPO_URL" "$TMP_DIR" || { echo "[-] Failed to clone repository."; exit 1; }

sleep 2

echo "[+] Copying files to home directory..."
cd "$TMP_DIR"
cp -a "$TMP_DIR"/. ~/ || { echo "[-] Failed to copy tmux files."; exit 1; }
echo "[✓] Files copied successfully."

sleep 2

echo "[+] Installing OneShot dependencies..."
pkg install -y root-repo
pkg install -y wpa-supplicant pixiewps iw openssl || { echo "[-] Failed to install OneShot dependencies."; exit 1; }
echo "[✓] OneShot dependencies installed."

sleep 2

echo "[+] Compiling OneShot..."

sleep 2

make ~/OneShot-C/oneshot && chmod +x oneshot || { echo "[-] Failed to compile OneShot-C."; exit 1; }
echo "[✓] Compiled OneShot successfully (ignore the warnings)."

sleep 2

echo "[+] Cleaning up..."
rm -rf "$TMP_DIR"

sleep 2

echo "[✓] Done."

sleep 1
