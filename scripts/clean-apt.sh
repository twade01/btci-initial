#!/usr/bin/env bash

set -euf -o pipefail

apt-get autoremove -y
apt-get clean -y
