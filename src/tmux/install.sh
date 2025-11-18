#!/usr/bin/env bash
set -e

# ubuntu, debian, etc
if command -v apt-get >/dev/null 2>&1 ; then
  apt-get update -y
  apt-get install -y tmux
fi

# rhel, fedora, etc
if command -v dnf >/dev/null 2>&1 ; then #  dnf check-update
#  dnf -y update --setopt=tsflags=nodocs --nogpgcheck
  dnf install tmux -y --setopt=tsflags=nodocs --nogpgcheck
fi

# arch btw
if command -v pacman >/dev/null 2>&1 ; then
  pacman -Syu --noconfirm tmux
fi

