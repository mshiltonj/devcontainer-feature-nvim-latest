#!/usr/bin/bash
apt-get update && apt-get install -y wget

PLATFORM_ARCH=$(uname -m)

if [[ "$PLATFORM_ARCH" == "x86_64" ]]; then
  PLATFORM="arm64"
elif [[ "$PLATFORM_ARCH" == "aarch64" ]]; then
  PLATFORM="arm64"
else
  echo "Unsupported platform: $PLATFORM_ARCH"
  exit 1
fi

DL_FILE="nvim-linux-${PLATFORM}.tar.gz"

if [[ -f "/tmp/${DL_FILE}" ]]; then
  rm "/tmp/${DL_FILE}"
fi

if [[ -f /opt/nvim ]]; then
  rm /opt/nvim
fi

mkdir -p /opt
wget -q -P /tmp https://github.com/neovim/neovim/releases/download/nightly/${DL_FILE}
tar -C /opt -zxvf /tmp/${DL_FILE}
rm /tmp/${DL_FILE}
mv /opt/nvim-linux-${PLATFORM} /opt/nvim
echo 'export PATH="/opt/nvim/bin:$PATH"' >> /etc/profile

