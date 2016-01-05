# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  $secret_key = ENV['SECRET_KEY']

  config.vm.provision "shell" do |s|
    s.inline = 'echo "export SECRET_KEY=$1" | tee -a /home/vagrant/.bashrc'
    s.args = [$secret_key]
  end

  $database_url = ENV['DATABASE_URL']

  config.vm.provision "shell" do |s|
    s.inline = 'echo "export DATABASE_URL=$1" | tee -a /home/vagrant/.bashrc'
    s.args = [$database_url]
  end

  config.vm.provision "shell", path: "provisioning/main.sh"

  config.vm.network "forwarded_port", guest: 8000, host: 8001
end
