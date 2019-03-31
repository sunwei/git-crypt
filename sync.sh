#!/bin/bash
set -e

_check_dependence() {
  command -v gpg2 > /dev/null 2>&1 || ( echo "> gpg2 required." && exit 1 )
  command -v scp > /dev/null 2>&1 || ( echo "> scp required." && exit 1 )
  command -v ssh > /dev/null 2>&1 || ( echo "> ssh required." && exit 1 )
}

_export_private_key(){
  gpg2 --list-secret-keys
  gpg2 --export-secret-keys "${1}" > "${1}.asc"
}

_mv_key(){
  # We need to config remote host firstly, with ssl /root/.ssh/authorized_keys
  scp -r "${2}.asc" "root@${1}:/${2}.asc"
}

main(){
  local keyID="${1}"
  local remoteHost="${2}"

  _check_dependence
  _export_private_key "${keyID}"
  _mv_key "${remoteHost}" "${keyID}"
}

main "${@-}"