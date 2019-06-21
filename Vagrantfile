Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
    vb.cpus = "1"
  end
  
  #We will iterate over network, and define dc count
  #ip and dc
  [ "192.168.10", "192.168.20" ].to_enum.with_index(1).each do |ip, dc|

    config.vm.define vm_name="nomad-dc#{dc}" do |nomad|
      nomad.vm.box = "achuchulev/nomad"
      nomad.vm.hostname = "server-dc#{dc}"
      nomad.vm.network "forwarded_port", guest: 4646, host: 4646 if dc == 1
      nomad.vm.network "private_network", ip: "#{ip}.10", netmask:"255.255.0.0"
      nomad.vm.provision "shell", path: "scripts/nomad_config.sh"
      nomad.vm.provision "shell", inline: "sed -i \"s/dc1/dc#{dc}/g\" /etc/nomad.d/*.hcl"
      nomad.vm.provision "shell", path: "scripts/nomad_service.sh"
    end
    
  end # end ip, dc

end
