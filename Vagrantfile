Vagrant.configure(2) do |config|

  # remote-VM
  config.vm.define "desktop" do |remote|
    remote.vm.box = "ubuntu/bionic64"
    remote.vm.hostname = "ansible-remote"
    remote.vm.network "private_network", ip: "192.168.50.102"
    remote.vm.synced_folder ".", "/vagrant", :mount_options => ['dmode=775', 'fmode=664']

    remote.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
      vb.name = "ansible-remote"
      vb.gui = true
      vb.customize ["modifyvm", :id, "--vram", "128"]
      vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    remote.vm.provision "shell", privileged: false, inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y python python-apt aptitude
      sudo sed -i -e "s/PasswordAuthentication no/PasswordAuthentication yes/" /etc/ssh/sshd_config
      sudo service sshd restart
    SHELL

  end

  # control-VM
  config.vm.define "control" do |control|
    control.vm.box = "ubuntu/bionic64"
    control.vm.hostname = "ansible-control"
    control.vm.network "private_network", ip: "192.168.50.101"
    control.vm.synced_folder ".", "/vagrant", :mount_options => ['dmode=775', 'fmode=664']

    control.vm.provider "virtualbox" do |vb|
      vb.memory = 512
      vb.cpus = 2
      vb.name = "ansible-control"
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    control.vm.provision "shell", privileged: false, inline: <<-SHELL
      sudo apt-add-repository ppa:ansible/ansible
      sudo apt-get update
      sudo apt-get install -y ansible expect

      cp -f /vagrant/sendkey.expect ~/sendkey.expect
      chmod 774 ~/sendkey.expect

      mkdir -p ~/.ssh
      echo -e  'y\n' | ssh-keygen -N "" -f ~/.ssh/id_rsa

      rm -f ~/.ssh/known_hosts
      ~/sendkey.expect vagrant@192.168.50.102
    SHELL
  end

end
