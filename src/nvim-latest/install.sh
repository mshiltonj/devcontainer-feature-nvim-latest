#!/usr/bin/env bash

set -e

# ubuntu, debian, etc
if command -v apt-get >/dev/null 2>&1 ; then
  apt-get update -y
  apt-get install -y wget
fi

# rhel, fedora, etc
if command -v dnf >/dev/null 2>&1 ; then #  dnf check-update
#  dnf -y update --setopt=tsflags=nodocs --nogpgcheck
  dnf install wget -y --setopt=tsflags=nodocs --nogpgcheck
fi

# arch btw
if command -v pacman >/dev/null 2>&1 ; then
  pacman -Syu --noconfirm wget
fi

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

