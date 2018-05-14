node['sysctl']['configurations'].each do |sysctl_key, sysctl_value|
  sysctl sysctl_key do
    key      key
    value    sysctl_value
    action   :apply
  end
end
