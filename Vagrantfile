# -*- mode: ruby -*-
# vi: set ft=ruby :

boxes = [
  {
    :name => "ubuntu20.04",
    :eth1 => "192.168.205.13",
    :mem => "2048",
    :cpu => "2"
  }
]

Vagrant.configure("2") do |config|

  config.vm.box = "generic/ubuntu2004"

  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vbguest.installer_options = { allow_kernel_upgrade: true }
      config.vm.hostname = opts[:name]
      config.vm.provider "vmware_fusion" do |v|
        v.vmx["memsize"] = opts[:mem]
        v.vmx["numvcpus"] = opts[:cpu]
      end

      config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", opts[:mem]]
        v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
      end

      config.vm.network :private_network, ip: opts[:eth1]
    end
  end 

  config.vm.synced_folder "labs/", "/home/vagrant/labs"
  config.vm.provision "shell", privileged: true, path: "./setup.sh"
end
