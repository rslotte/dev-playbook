#!/usr/bin/env bash
set -euo pipefail


PLAY=""
if [[ "${OSTYPE}" == "linux-gnu" ]]; then
  source /etc/lsb-release
  if [[ "${DISTRIB_ID}" == *"Ubuntu"* && "${DISTRIB_RELEASE}" == "22"* ]]; then
    PLAY="ubuntu22.yml"
    if [[ $(uname -a) == *"microsoft-standard-WSL2"* ]]; then
	PLAY="${PLAY} wsl2.yml"
    fi
  fi
fi

rm -rf /tmp/ansible-term-dev
git clone https://gitlab.com/rslotte/ansible-term-dev.git /tmp/ansible-term-dev
ansible-playbook -K -u ${USER} /tmp/ansible-term-dev/${PLAY}
rm -rf /tmp/ansible-term-dev
