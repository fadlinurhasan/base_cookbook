groups = node['gate']['host']['default_group']
host_profile = data_bag_item('gate', 'host')
teams = node.tags.select { |element| element.include? 'team:' }
unless teams.empty?
  app_groups = teams.map { |team| team.split(':')[1] + '_ssh' }
  groups += app_groups
end
node.override['gate']['nss']['api_key'] = host_profile['api_key']
node.override['gate']['host']['groups'] = groups
include_recipe 'chef_gate::ssh'
