#!/bin/bash

## python3 + ubuntu16.04 + ansible = steaming pile of shit
## but after this you have a complete environment as of 8/2017
## all needed software will be installed, plus env vars be fixed, too

#virtualenv plus ansible dependencies
apt install python-minimal python-pip -y
export LC_ALL=C
pip install --upgrade pip
pip install virtualenv
pip install virtualenvwrapper

echo "export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/
export LC_ALL=C
. /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/
export LC_ALL=C
. /usr/local/bin/virtualenvwrapper.sh

mkproject -p python3 playbooks
echo "workon playbooks" >> ~/.bashrc
workon playbooks
pip install pyyaml
pip install jinja2

#ansible
cd /opt
apt install git -y
git clone --progress https://github.com/ansible/ansible
echo '. /opt/ansible/hacking/env-setup' >> ~/.bashrc

cd ~/playbooks

echo "[defaults]
hostfile = inventory/hosts
host_key_checking = False
ansible_ssh_user = root
ansible_ssh_port = 22
ansible_connection = smart
ansible_shell_type = sh
ansible_python_interpreter = /usr/bin/python3" > ansible.cfg

echo
echo logout and login again for fixed environment!
echo
