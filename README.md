# Simple salt examples

You need: [Vagrant](www.vagrantup.com)

Then run:

	vagrant up

Connect to the vm via ssh and run:

	sudo su
	salt-call --local state.highstate

	# test/play around:
	# when logging in via ssh again, you should have a new message in the welcome text
	# as the vagrant user you should now be able to run:
	computer, whoami

	# change what the server does:
	printf "id: webserver01\n" >> /etc/salt/minion
	salt-call --local state.highstate

	# get more pages dynamically
	salt-call --local grains.items
	salt-call --local grains.setval 'catcloud:pages' "['cluj', 'linz', 'vienna']"
	salt-call --local state.highstate

	# decide that being a db server is easier than a http server
	printf "id: dbserver01\n" >> /etc/salt/minion
	salt-call --local state.highstate



