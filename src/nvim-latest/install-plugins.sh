#!/usr/bin/env bash
# set -e

PLUGIN_DIR=${_CONTAINER_USER_HOME}/.local/share/nvim/site/vendor/opt

PLUGINS=$(echo -e "${PLUGINS}" | grep -oE '[^[:space:]]+' | tr '\n' ' ')

if [[ "${PLUGINS}" != "" ]];then
  IFS=$' '
  read -r -a NEOVIM_PLUGINS <<< "${PLUGINS}"
  pushd .
  su "${_CONTAINER_USER}" -c "mkdir -p ${PLUGIN_DIR}"
  cd "${PLUGIN_DIR}" || exit 1
  for PLUGIN in "${NEOVIM_PLUGINS[@]}"
  do
    su "${_CONTAINER_USER}" -c "git clone ${PLUGIN}"
  done
  popd || exit 1
fi

