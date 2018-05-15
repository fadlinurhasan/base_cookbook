require_relative 'spec_helper'

describe 'base_cookbook::_limits' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04') do |node|
      allow(node).to receive(:name).and_return('limits-test-node')
    end.converge(described_recipe)
  end

  it 'should update file and proc limits' do
    expect(chef_run).to create_limits_config('91').with(
      limits: [
        { 'domain' => '*', 'type' => 'hard', 'value' => 60_000, 'item' => 'nofile' },
        { 'domain' => '*', 'type' => 'soft', 'value' => 40_000, 'item' => 'nofile' },
        { 'domain' => '*', 'type' => 'hard', 'value' => 60_000, 'item' => 'nproc' },
        { 'domain' => '*', 'type' => 'soft', 'value' => 40_000, 'item' => 'nproc' }
      ]
    )
  end
end
