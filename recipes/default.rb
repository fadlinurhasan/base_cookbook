include_recipe 'base_cookbook::_hostname'
include_recipe 'base_cookbook::_packages'
include_recipe 'base_cookbook::_limits'

# TODO: should investigate what's working and what's not for sysctl in container
#include_recipe 'base_cookbook::_sysctl'

include_recipe 'base_cookbook::_ntp'
include_recipe 'base_cookbook::_gate' if node['gate']['enabled']
include_recipe 'sudo'
