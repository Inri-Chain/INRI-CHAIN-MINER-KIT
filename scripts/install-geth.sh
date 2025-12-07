#!/usr/bin/env bash
# install-geth.sh
# Installs the latest go-ethereum (geth) release for Linux AMD64
# Usage: sudo ./install-geth.sh

set -euo pipefail

if [[ "$EUID" -ne 0 ]]; then
  echo "Run as root: sudo $0"
  exit 1
fi

TMPDIR=$(mktemp -d)
cd "$TMPDIR"

echo "Fetching latest go-ethereum release from GitHub..."
API_URL="https://api.github.com/repos/ethereum/go-ethereum/releases/latest"
ASSET_URL=$(curl -s "$API_URL"   | grep -E '"browser_download_url":'   | grep "linux-amd64"   | cut -d '"' -f 4   | head -n 1)

if [[ -z "$ASSET_URL" ]]; then
  echo "Could not find linux-amd64 asset in latest release. Exiting."
  exit 2
fi

echo "Found asset: $ASSET_URL"
echo "Downloading..."
curl -L --progress-bar -o geth.tar.gz "$ASSET_URL"

echo "Extracting..."
tar -xzf geth.tar.gz

GETH_BIN=$(find . -type f -name geth -perm /a+x | head -n 1)

if [[ -z "$GETH_BIN" ]]; then
  echo "geth binary not found in archive. Exiting."
  exit 3
fi

echo "Installing geth to /usr/local/bin (backup if exists)..."
if [[ -f /usr/local/bin/geth ]]; then
  mv /usr/local/bin/geth /usr/local/bin/geth.bak.$(date +%s)
fi

cp "$GETH_BIN" /usr/local/bin/geth
chmod +x /usr/local/bin/geth

echo "Cleaning up..."
cd /
rm -rf "$TMPDIR"

echo "geth installed to /usr/local/bin/geth"
echo "Version:"
geth version

echo "Done. You can now run geth (e.g. geth --version)."
