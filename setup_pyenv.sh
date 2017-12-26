#!/usr/bin/env bash

# pyenv is already installed in install_brew_cask_formulae.sh

pyenv install 2.7.14
pyenv install 3.6.3
echo "[\$_\$] pyenv versions"
pyenv versions
echo "[\$_\$] pip --version"
pip --version

pip install Django
echo "[\$_\$] print django verion:"
python -c "import django; print(django.get_version())"

echo "Switch back to pyenv global system"
pyenv global system
