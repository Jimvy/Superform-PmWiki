#!/usr/bin/env bash
# Inside this script, put everything needed to install the environment

cd /vagrant/files

# Search for an appropriate name for the file, change its mode, and make a link to reduce the clutter of commands
find . -name "xampp-linux-x64-*-installer.run" -execdir chmod +x {} \; -execdir ln -s {} xampp-installer.run \;

# execute it; normally it should use the defaults correctly
./xampp-installer.run
