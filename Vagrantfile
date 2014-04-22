# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.0.20"
  config.vm.hostname = "suploy.com"
	
	# Tell virtualbox to use 2 cores and 2048mb of RAM
	config.vm.provider :virtualbox do |vb|
		vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]   
  end 

   config.vm.synced_folder "./", "/home/vagrant/suploy"
end
