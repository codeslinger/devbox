# fix Ubuntu's incorrect major:minor numbers on /dev/u?random so Java apps don't hang forever
# execute "sudo rm /dev/urandom && sudo mknod -m 0644 /dev/random c 1 8" do
#   not_if 'ls -l /dev/urandom | grep -q "1, 8"'
# end
# execute "sudo rm /dev/random && sudo mknod -m 0644 /dev/random c 1 9" do
#   not_if 'ls -l /dev/random | grep -q "1, 9"'
# end

cookbook_file "/etc/sysctl.conf" do
  source  "sysctl.conf"
  owner   "root"
  group   "root"
  mode    0644
end

cookbook_file "/etc/security/limits.conf" do
  source  "limits.conf"
  owner   "root"
  group   "root"
  mode    0644
end

package "git-core"
package "maven2"
package "ruby-dev"
package "rubygems"

gem_package "rake"

directory "/home/#{node[:user]}/.m2" do
  owner   node[:user]
  group   node[:user]
  mode    0755
  action  :create
end

cookbook_file "/home/#{node[:user]}/.m2/settings.xml" do
  source  "settings.xml"
  owner   node[:user]
  group   node[:user]
  mode    0644
end

