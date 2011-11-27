# vim:set ts=2 sw=2 et ai syn=ruby ft=ruby:

Vagrant::Config.run do |config|
  config.vm.box = "oneiric64"
  config.vm.box_url = "http://dl.dropbox.com/u/3886896/oneiric64.box"
  config.vm.host_name = "dev"

  config.vm.customize do |vm|
    vm.memory_size = 2048
    vm.name = "dev"
  end

  config.vm.forward_port "ssh", 22, 10022
  config.vm.forward_port "http", 80, 10080
  config.vm.forward_port "https", 443, 10443
  config.vm.forward_port "rails", 3000, 13000

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.json = {:user => ENV['USER']}
    chef.add_recipe "accounts"
    chef.add_recipe "build-essential"
    chef.add_recipe "basedev"
    # You can put together a user-specific cookbook to set up your own VM how
    # you like by adding it to cookbooks/your_user_name
    chef.add_recipe ENV['USER'] if File.directory?("cookbooks/#{ENV['USER']}")
  end
end

