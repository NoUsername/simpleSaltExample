#!/bin/bash
MARKER_FILE="/root/.provisioned"

#exit 0

if [ ! -f $MARKER_FILE ]; then
	sudo apt-get update
	sudo apt-get install -y dos2unix

	touch $MARKER_FILE
fi

if [ ! hash salt-minion 2>/dev/null ]; then
	# salt not installed, install it
	wget -k -O /root/install_salt.sh -L http://bootstrap.saltstack.org 
	sudo sh /root/install_salt.sh
fi

cp -r /vagrant/salt-configs/* /srv/

echo "now simply run salt-call --local state.highstate"