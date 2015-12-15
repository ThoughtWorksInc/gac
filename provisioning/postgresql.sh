#!/bin/bash

set -e

if is_package_present postgresql-9.4; then
    echo "Package postgresql-9.4 is already installed!"
else
    sudo echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" | tee -a /etc/apt/sources.list.d/pgdg.list
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    sudo apt-get -y update
    install_package_if_not_present postgresql-server-dev-all
    install_package_if_not_present postgresql-9.4
fi

