#!/usr/bin/env bash
set -e

PLUGIN_DIR=${_CONTAINER_USER_HOME}/.local/share/nvim/site/vendor/opt

echo "PLUGINS ${PLUGINS}"
if [[ "${PLUGINS}" != "" ]];then
  IFS=','
  read -ra NEOVIM_PLUGINS <<< "${PLUGINS}"
  echo "NEOVIM_PLUGINS ${NEOVIM_PLUGINS[@]}"
  pushd .
  #echo su ${_CONTAINER_USER} mkdir -p "${PLUGIN_DIR}"
  su ${_CONTAINER_USER} -c "mkdir -p ${PLUGIN_DIR}"
  cd "${PLUGIN_DIR}"
  for PLUGIN in "${NEOVIM_PLUGINS[@]}"
  do
    su ${_CONTAINER_USER} -c "git clone ${PLUGIN}"
  done
  popd
fi

