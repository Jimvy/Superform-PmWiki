# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.network "forwarded_port", guest: 80, host: 5001
  config.vm.network "forwarded_port", guest: 81, host: 5002

  # config.vm.network "private_network", ip: "192.168.33.10"

  # config.vm.network "public_network"

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "StudINGIWiki"
  end

  config.vm.provision :shell, path:"bootstrap.sh"

  config.vm.provision "shell", inline: "/opt/lampp/lampp start", run: "always"
end
