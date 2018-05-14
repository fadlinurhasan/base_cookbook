require_relative 'spec_helper'

describe 'base_cookbook::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      .converge(described_recipe)
  end

  it 'should run hostname recipe' do
    expect(chef_run).to include_recipe('base_cookbook::_hostname')
  end

  it 'should run packages recipe' do
    expect(chef_run).to include_recipe('base_cookbook::_packages')
  end

  it 'should run limits recipe' do
    expect(chef_run).to include_recipe('base_cookbook::_limits')
  end

  it 'should run users recipe' do
    expect(chef_run).to include_recipe('base_cookbook::_users')
  end

  it 'should run sysctl recipe' do
    expect(chef_run).to include_recipe('base_cookbook::_sysctl')
  end

  it 'should run ntp recipe' do
    expect(chef_run).to include_recipe('base_cookbook::_ntp')
  end

  it 'should run gate recipe if enabled' do
    chef_run = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04') do |node|
      node.normal['gate']['enabled'] = true
      stub_data_bag_item("gate", "host").and_return(SecureRandom.uuid)
    end.converge(described_recipe)
    expect(chef_run).to include_recipe('base_cookbook::_gate')
  end

  it 'shouldn\'t run gate recipe if disabled' do
    chef_run = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04') do |node|
      node.normal['gate']['enabled'] = false
    end.converge(described_recipe)
    expect(chef_run).not_to include_recipe('base_cookbook::_gate')
  end
end
