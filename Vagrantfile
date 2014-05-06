# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise32"

  config.vm.provision "shell", path: "onBoot.sh"

  config.vm.network :forwarded_port, host: 8888, guest: 80

end
