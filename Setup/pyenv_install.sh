#!/bin/bash

echo "Pyenv Installation Script"

# install pyenv for managing use of multiple python versions
curl https://pyenv.run | bash

# update path by appending the following to ~/.bashrc
### export PATH="/home/jetson/.pyenv/bin:$PATH"
### eval "$(pyenv init -)"
### eval "$(pyenv virtualenv-init -)"

echo "Append lines to ~/.bashrc from this script. Exit and reopen terminal to ensure PATH changes take effect."
