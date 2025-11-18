#!/usr/bin/env bash
set -e

# ubuntu, debian, etc
if command -v apt-get >/dev/null 2>&1 ; then
  apt-get update
  apt-get install -y tmux
fi

# rhel, fedora, etc
if command -v dnf >/dev/null 2>&1 ; then
  dnf check-update
  dnf install tmux -y
fi

# arch btw
if command -v pacman >/dev/null 2>&1 ; then
  pacman -Syu --noconfirm tmux  
fi


