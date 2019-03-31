#!/bin/bash
set -e

_check_dependence() {
  command -v gpg2 > /dev/null 2>&1 || ( echo "> gpg2 required." && exit 1 )
  command -v scp > /dev/null 2>&1 || ( echo "> scp required." && exit 1 )
  command -v ssh > /dev/null 2>&1 || ( echo "> ssh required." && exit 1 )
}

gpg2 --list-secret-keys
gpg2 --export-secret-keys "${KEYID}" > "${KEYID}.asc"
scp
ssh
gpg2 --import "${KEYID}.asc"

main(){
  _check_dependence
  _export_private_key
  _login_remote_host
  _import_private_key
  _close_connection
}

main "${@-}"