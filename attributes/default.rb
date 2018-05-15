default['sysctl']['configurations'] = {
  'net.core.somaxconn' => 32_768,
  'net.ipv4.conf.all.send_redirects' => 1,
  'net.ipv4.ip_nonlocal_bind' => 1,
  'net.ipv4.tcp_abort_on_overflow' => 0,
  'net.ipv4.tcp_fin_timeout' => 1,
  'net.ipv4.tcp_keepalive_time' => 300,
  'net.ipv4.tcp_max_orphans' => 262_144,
  'net.ipv4.tcp_max_syn_backlog' => 163_84,
  'net.ipv4.tcp_max_tw_buckets' => 262_144,
  'net.ipv4.tcp_reordering' => 3,
  'net.ipv4.tcp_synack_retries' => 3,
  'net.ipv4.tcp_syncookies' => 1,
  'net.ipv4.tcp_syn_retries' => 5,
  'net.ipv4.tcp_timestamps' => 0,
  'net.ipv4.tcp_tw_recycle' => 0,
  'net.ipv4.tcp_tw_reuse' => 0,
  'net.ipv4.tcp_mem' => '265536 298304 2131072',
  'net.core.netdev_max_backlog' => 120_000,
  'net.core.wmem_max' => 125_829_120,
  'net.core.rmem_max' => 125_829_120,
  'net.ipv4.tcp_rmem' => '20480 174760 25165824',
  'net.ipv4.tcp_wmem' => '20480 174760 25165824',
  'net.ipv4.tcp_window_scaling' => 1,
  'net.unix.max_dgram_qlen' => 256
}

override['authorization']['sudo']['groups'] = %w[sysadmin sudo adm wheel]
override['authorization']['sudo']['include_sudoers_d'] = true
override['authorization']['sudo']['passwordless'] = true

override['ntp']['servers'] = [
  'server 0.id.pool.ntp.org',
  'server 1.id.pool.ntp.org',
  'server 2.id.pool.ntp.org',
  'server 3.id.pool.ntp.org'
]
sync_hw_clock = !['lxc'].include?(node['virtualization']['system'])
override['ntp']['sync_hw_clock'] = sync_hw_clock

default['ntp']['primary_servers'] = ['metadata.google.internal']
default['ntp']['fallback_servers'] = [
  '0.id.pool.ntp.org',
  '1.id.pool.ntp.org',
  '2.id.pool.ntp.org',
  '3.id.pool.ntp.org'
]

default['users']['limits'] = [{
  'name' => '91',
  'limits' => [
    { domain: '*', type: 'hard', value: 60_000, item: 'nofile' },
    { domain: '*', type: 'soft', value: 40_000, item: 'nofile' },
    { domain: '*', type: 'hard', value: 60_000, item: 'nproc' },
    { domain: '*', type: 'soft', value: 40_000, item: 'nproc' }
  ],
  'use_system_limit_file' => false
}]

override['gate']['url'] = 'gate.gojek.co.id'
override['gate']['public_url'] = 'gate.gojek.co.id'
default['gate']['enabled'] = false
default['gate']['host']['app_group'] = ''
default['gate']['host']['default_group'] = ['systems_ssh']
