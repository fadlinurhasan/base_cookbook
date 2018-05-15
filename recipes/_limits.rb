node['users']['limits'].each do |user|
  limits_config user['name'] do
    limits user['limits']
    use_system user['use_system_limit_file']
  end
end
