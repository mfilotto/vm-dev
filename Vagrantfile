# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  if Vagrant.has_plugin?("vagrant-proxyconf")
    puts "find proxyconf plugin !"
    if ENV["http_proxy"]
      puts "http_proxy: " + ENV["http_proxy"]
      config.proxy.http     = ENV["http_proxy"]
    end
    if ENV["https_proxy"]
      puts "https_proxy: " + ENV["https_proxy"]
      config.proxy.https    = ENV["https_proxy"]
    end
    if ENV["no_proxy"]
      config.proxy.no_proxy = ENV["no_proxy"]
    end
  end
  
  config.vm.provider "virtualbox" do |vb|
      vb.memory = ENV['VM_MEMORY'] || 4096
      vb.name = ENV['VM_NAME'] || 'VM DEV FROM VAGRANT'
      vb.gui = true
      vb.customize ["modifyvm", :id, "--clipboard",   "bidirectional"]
      vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
  end
  config.vm.define :master do |masterless_config|
    masterless_config.vm.box = "centos/7"
    masterless_config.vm.host_name = 'saltmasterless.local'
    masterless_config.vm.network "private_network", ip: "192.168.50.10"
    masterless_config.vm.synced_folder "saltstack/salt/", "/srv/salt"
    masterless_config.vm.synced_folder "saltstack/pillar/", "/srv/pillar"

    masterless_config.vm.provision :salt do |salt|
      salt.install_type = "stable"
      salt.masterless = true
      salt.minion_config = "saltstack/etc/minion"
      salt.run_highstate = true
      salt.verbose = true
      salt.colorize = true
    end
  end
end
