#!/usr/bin/env bash

set -euf -o pipefail

TIMEZONE="US/Mountain"

# Configure TimeZone
ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
