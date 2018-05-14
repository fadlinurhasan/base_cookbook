require_relative "spec_helper"

describe "base_cookbook::_sysctl" do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: "ubuntu", version: "16.04") do |node|
    end.converge(described_recipe)
  end

  sysctl_attrs = {
    "net.core.somaxconn" => 32_768,
    "net.ipv4.conf.all.send_redirects" => 1,
    "net.ipv4.ip_nonlocal_bind" => 1,
    "net.ipv4.tcp_abort_on_overflow" => 0,
    "net.ipv4.tcp_fin_timeout" => 1,
    "net.ipv4.tcp_keepalive_time" => 300,
    "net.ipv4.tcp_max_orphans" => 262_144,
    "net.ipv4.tcp_max_syn_backlog" => 163_84,
    "net.ipv4.tcp_max_tw_buckets" => 262_144,
    "net.ipv4.tcp_reordering" => 3,
    "net.ipv4.tcp_synack_retries" => 3,
    "net.ipv4.tcp_syncookies" => 1,
    "net.ipv4.tcp_syn_retries" => 5,
    "net.ipv4.tcp_timestamps" => 0,
    "net.ipv4.tcp_tw_recycle" => 0,
    "net.ipv4.tcp_tw_reuse" => 0,
    "net.ipv4.tcp_mem" => "265536 298304 2131072",
    "net.core.netdev_max_backlog" => 120_000,
    "net.core.wmem_max" => 125_829_120,
    "net.core.rmem_max" => 125_829_120,
    "net.ipv4.tcp_rmem" => "20480 174760 25165824",
    "net.ipv4.tcp_wmem" => "20480 174760 25165824",
    "net.ipv4.tcp_window_scaling" => 1,
    "net.unix.max_dgram_qlen" => 256
  }

  sysctl_attrs.each do |sysctl_key, sysctl_value|
    it "should create sysctl config 99-chef-#{sysctl_key}.conf" do
      expect(chef_run).to apply_sysctl(sysctl_key).with(
        value: sysctl_value.to_s
      )
    end
  end
end
