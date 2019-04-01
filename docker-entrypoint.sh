#!/bin/bash
set -e

_exit_err() {
  echo "ERROR: ${1}" >&2
  exit 1
}

GPG_KEY="/app/key/${GPGKEY}"
echo ${GPG_KEY}
echo "> Check and import private gpg key..."
if [[ -e "${GPG_KEY}" ]]; then
  gpg2 --import "${GPG_KEY}"
else
  _exit_err "GPG key not found!"
fi

REPO=/app/repo
echo "> Check and import private gpg key..."
if find "${REPO}" -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
  cd "${REPO}" && pwd
  git-crypt status
else
  _exit_err "Repository not found!"
fi

exec "$@"