require_relative 'spec_helper'

describe 'base_cookbook::_hostname' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04') do |node|
      allow(node).to receive(:name).and_return('test_instance')
    end.converge(described_recipe)
  end

  it 'should update the hostanme in /etc/hostname and permissions' do
    expect(chef_run).to create_file('/etc/hostname').with(
      content: 'test_instance',
      owner:   'root',
      group:   'root',
      mode:    '0644'
    )
  end
end
