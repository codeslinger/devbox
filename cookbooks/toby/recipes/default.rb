include_recipe "vim"
include_recipe "screen"
include_recipe "toby::ssh"

cookbook_file "/home/toby/bootstrap.sh" do
  source "bootstrap.sh"
  owner  "toby"
  group  "toby"
  mode   0755
end

