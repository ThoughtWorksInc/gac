# -*- mode: ruby -*-
# vi: set ft=ruby :

REQUIRED = true
NOT_REQUIRED = false

def set_variable(config, variable_name, is_required)
  value = ENV[variable_name]

  if value.to_s == '' && is_required
    raise "#{variable_name} value is required."
  end

  if value.to_s != ''
    config.vm.provision 'shell' do |s|
      s.inline = "echo \"export #{variable_name}=#{value}\" | tee -a /home/vagrant/.bashrc"
    end
  end
end

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  environment_variables = {
    'SECRET_KEY' => REQUIRED,
    'DATABASE_URL' => NOT_REQUIRED,
  }

  environment_variables.keys.each do |variable_name|
    set_variable config, variable_name, environment_variables[variable_name]
  end

  config.vm.provision 'shell', path: 'provisioning/main.sh'
  config.vm.network 'forwarded_port', guest: 8000, host: 8001
end
