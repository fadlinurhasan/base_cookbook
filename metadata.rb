name 'base_cookbook'
maintainer 'GOJEK Engineering'
maintainer_email 'baritolog@go-jek.com'
license 'Apache-2.0'
description 'Base Cookbook'
long_description 'Base cookbook for all other cookbooks of baritolog'
version '0.1.0'
supports 'ubuntu'
chef_version '>= 12.14' if respond_to?(:chef_version)

issues_url 'https://github.com/BaritoLog/base_cookbook/issues'
source_url 'https://github.com/BaritoLog/base_cookbook'

depends 'apt'
depends 'limits'
depends 'ntp'
depends 'ohai'
depends 'sudo'
depends 'users'
# depends 'logrotate'
depends 'chef_gate'
