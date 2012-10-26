#!/bin/bash

echo "Setup Python"

if [[ ! -x "$(/usr/bin/which -s pythonz)" ]]; then
    echo "Install Pythonz ..."
    curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash
    source $HOME/.pythonz/etc/bashrc
fi

echo "Install Python ..."
pythonz install 2.7.3
export PATH=$HOME/.pythonz/pythons/CPython-2.7.3/bin:$PATH

curl http://peak.telecommunity.com/dist/ez_setup.py | python


easy_install pip
pip install ipython Mercurial httpie
pip install virtualenv virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

echo "Done python setup"
