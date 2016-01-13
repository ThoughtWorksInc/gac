# -*- mode: ruby -*-
# vi: set ft=ruby :

def set_variable(config, variable_name)
  value = ENV[variable_name]

  if value.to_s != ''
    config.vm.provision 'shell' do |s|
      s.inline = "echo export #{variable_name}=\"\'\"\'#{value.to_s}\'\"\'\" | tee -a /home/vagrant/.bashrc"
    end
  end
end

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  environment_variables = [
    'SECRET_KEY',
    'DATABASE_URL',
    'GOOGLE_CLIENT_ID',
    'GOOGLE_CLIENT_SECRET',
    'DEBUG'
  ]

  environment_variables.each do |variable_name|
    set_variable config, variable_name
  end

  config.vm.provision 'shell', path: 'provisioning/main.sh'
  config.vm.network 'forwarded_port', guest: 8000, host: 8001
end
