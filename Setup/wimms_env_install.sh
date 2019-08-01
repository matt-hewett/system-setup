# ensure pyenv is up to date
pyenv update

# create pyenv for python3.7.4
pyenv install 3.7.4

# switch to python 3.7.4 (instead of default 3.6.x)
pyenv local 3.7.4

# create venv for wimss project
cd /home/jetson/Documents/
mkdir Venvs
cd Venvs/
python -m venv wimss

