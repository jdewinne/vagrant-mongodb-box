# -*- mode: ruby -*-
# vi: set ft=ruby :

#
# Mongo db
#
# Each component is provisioned via a Puppet manifest in the manifests directory.
#

host_only_network = "192.172.1"

Vagrant::Config.run do |config|

  config.vm.define :mongodb do |mongodb_config|
    mongodb_config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    mongodb_config.vm.box = "precise64"
    mongodb_config.vm.customize [
     "modifyvm", :id,
     "--memory", "4096"
    ]
    mongodb_config.vm.customize ["modifyvm", :id, "--cpus", "2"]
    mongodb_config.vm.customize ["modifyvm", :id, "--ioapic", "on"]
    mongodb_config.vm.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    mongodb_config.vm.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    
    mongodb_config.vm.network :hostonly, host_only_network + ".10", :adapter => 2

    # Enable the Puppet provisioner
    mongodb_config.vm.provision :puppet do |puppet|
      puppet.manifest_file = "singlevm.pp"
      puppet.module_path = "~/.puppet/modules"
      puppet.manifests_path = "manifests"
    end
  end

end
