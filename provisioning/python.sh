#!/bin/bash

set -e

VIRTUALENVS_HOME=/home/vagrant/.virtualenvs
VIRTUALENV_GAC=${VIRTUALENVS_HOME}/GAC

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
fi

# p option makes no error be reported if directory already exists
mkdir -p $VIRTUALENVS_HOME
virtualenv $VIRTUALENV_GAC
chown -R vagrant:vagrant $VIRTUALENVS_HOME

echo "source ${VIRTUALENV_GAC}/bin/activate" | tee -a /home/vagrant/.bashrc
source ${VIRTUALENV_GAC}/bin/activate

echo "pip install -r /vagrant/gac/requirements.txt"
pip install -r /vagrant/gac/requirements.txt
