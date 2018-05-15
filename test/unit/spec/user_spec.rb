require_relative 'spec_helper'

describe 'base_cookbook::_users' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04') do |node|
    end.converge(described_recipe)
  end
  it 'should create user' do
    expect(chef_run).to create_users_manage('sysadmin').with(
      data_bag: 'users'
    )
  end
end
