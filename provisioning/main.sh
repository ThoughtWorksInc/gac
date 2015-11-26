#!/bin/bash

set -e # Stop script on error

is_package_present() {
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' "$1" | grep "install ok installed")
    if [ "" = "$PKG_OK" ]; then
        return 1
    else
        return 0
    fi
}

install_package_if_not_present() {
    if is_package_present "$1" -eq 0; then
        echo "Package $1 already installed"
    else
        sudo apt-get install -y "$1"
    fi
}

install_postgresql() {
    if is_package_present postgresql-9.4; then
        echo "Package postgresql-9.4 is already installed!"
    else
        sudo echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" | tee -a /etc/apt/sources.list.d/pgdg.list
        wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
        sudo apt-get -y update
        install_package_if_not_present postgresql-9.4
    fi
}

sudo apt-get -y update
sudo apt-get -y upgrade
install_postgresql
