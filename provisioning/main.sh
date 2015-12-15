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


sudo apt-get -y update
sudo apt-get -y upgrade


source /vagrant/provisioning/postgresql.sh
source /vagrant/provisioning/python.sh
