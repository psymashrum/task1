Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.hostname = "reverse"
  config.vm.provision "shell",
    inline: "rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm"
  config.vm.provision "shell",
    inline: "yum install -y ansible"  
  config.vm.provision :ansible do |ansible|
    ansible.groups = {
      'webservers' => ['default'],
       "dev_enviroment" => ["default"]
    }
    ansible.playbook = "nginx.yml"
    ansible.playbook = "site.yml"
  end
  config.vm.network "forwarded_port", guest: 8888, host: 8888
end
