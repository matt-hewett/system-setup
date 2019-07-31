#!/bin/bash

echo "Installing python3.7 for default system-wide access."

sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.7

sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2
echo "Use: 'sudo update-alternatives --config python3' and select default python"

