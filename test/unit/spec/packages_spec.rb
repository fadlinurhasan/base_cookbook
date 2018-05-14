require_relative "spec_helper"

describe "base_cookbook::_packages" do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: "ubuntu", version: "16.04") do |node|

    end.converge(described_recipe)
  end

  it "should update apt repo" do
    expect(chef_run).to update_apt_update('update_repo')
  end

    it "installs vim, htop, iotop, sysstat, lsof, net-ttols" do
      expect(chef_run).to install_package(%w(vim htop iotop sysstat lsof net-tools))
    end
end
