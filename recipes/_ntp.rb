apt_package 'ntp'do
  action :purge
end

template '/etc/systemd/timesyncd.conf' do
  source 'timesyncd.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    :primary_ntp_servers => node['ntp']['primary_servers'],
    :fallback_ntp_servers => node['ntp']['fallback_servers']
  )
end

bash "timedatectl-tweak" do
  code <<-EOH
      set -ex
      timedatectl set-timezone UTC
      timedatectl set-local-rtc 1
      timedatectl --adjust-system-clock
      timedatectl set-ntp 1
      EOH
end

service 'systemd-timesyncd' do
  action %i(restart enable)
end
