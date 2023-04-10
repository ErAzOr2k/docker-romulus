#!/usr/bin/env sh
#shellcheck shell=sh

set -xe

HOME=/config
export HOME

cd /config

# Set up symlinks.
# We need to launch Romulus from /config as this is where it will write its config.
ln -fs /opt/romulus/Romulus.exe /config/Romulus.exe || true
ln -fs /opt/romulus/headers /config/headers || true

# Allow running of native linux binaries
/usr/lib/wine/wine regedit /C /run_native_applications.reg

# Launch romulus
/usr/lib/wine/wine /config/Romulus.exe 2>&1 | awk -W Interactive '{print "[romulus] " $0}'