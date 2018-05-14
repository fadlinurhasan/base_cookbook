file '/etc/hostname' do
  content node.name
  owner 'root'
  group 'root'
  mode '0644'
end
