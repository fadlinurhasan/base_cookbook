require_relative 'spec_helper'

describe 'base_cookbook::_ntp' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04') do |node|
    end.converge(described_recipe)
  end

  it 'should purge apt package ntp' do
    expect(chef_run).to purge_apt_package('ntp')
  end

  it 'should update /etc/systemd/timesyncd.conf' do
    expect(chef_run).to create_template('/etc/systemd/timesyncd.conf').with(
      source: 'timesyncd.conf.erb',
      owner: 'root',
      group: 'root',
      mode: '0644',
      variables: {
        :primary_ntp_servers => ['metadata.google.internal'],
        :fallback_ntp_servers => [
          '0.id.pool.ntp.org',
          '1.id.pool.ntp.org',
          '2.id.pool.ntp.org',
          '3.id.pool.ntp.org'
        ]
      }
    )
  end

  it 'should tweak timedatectl attributes' do
    expect(chef_run).to run_bash('timedatectl-tweak')
  end

  it 'should enable systemd-timesyncd service' do
    expect(chef_run).to enable_service('systemd-timesyncd')
  end

  it 'should restart systemd-timesyncd service' do
    expect(chef_run).to restart_service('systemd-timesyncd')
  end
end
