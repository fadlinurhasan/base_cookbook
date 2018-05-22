node['sysctl']['configurations'].each do |sysctl_key, sysctl_value|
  sysctl sysctl_key do
    key      sysctl_key
    value    sysctl_value
    action   :apply
  end
end
