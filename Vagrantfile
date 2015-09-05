# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "dansweeting/ubuntu-trusty64-mongo-node"
  config.hostsupdater.aliases = ["dateapp.local"]
    config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder "./", "/var/www/", owner: "www-data", group: "www-data"

  config.vm.provider :virtualbox do |vb|
     vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
     vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
  end
  config.vm.provision :shell, :path => ".config/vagrant_provision.sh"
end
