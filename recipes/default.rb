include_recipe "base_cookbook::_hostname"
include_recipe "base_cookbook::_packages"
include_recipe "base_cookbook::_limits"
include_recipe "base_cookbook::_users"
include_recipe "base_cookbook::_sysctl"
include_recipe "base_cookbook::_ntp"
include_recipe "base_cookbook::_gate" if node["gate"]["enabled"]
#include_recipe "sudo"
