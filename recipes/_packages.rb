apt_update 'update_repo' do
  action :update
end
package %w(vim htop iotop sysstat lsof net-tools)
