#!/bin/bash

echo "Jetson TX2 Installation Script"

# update system software
sudo apt-get update
sudo apt-get upgrade

# install prerequisites for pyenv
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

# update pip and install pipenv for creating venvs
pip install --upgrade pip
pip install pipenv
