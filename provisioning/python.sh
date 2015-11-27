#!/bin/bash

set -e

is_pip_package_installed() {
    PIP3_SHOW_OUTPUT=$(pip3 show "$1" | grep "$1")
    if [ "" = "$PIP3_SHOW_OUTPUT" ]; then
        return 1
    else
        return 0
    fi
}

install_package_if_not_present python3-pip

if is_pip_package_installed virtualenv; then
    echo "Virtualenv already installed"
else
    sudo pip3 install virtualenv
    virtualenv GAC
    echo "source ~/GAC/bin/activate" | tee -a /home/vagrant/.bashrc
fi
