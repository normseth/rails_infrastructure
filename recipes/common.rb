include_recipe 'apt'
include_recipe 'chef-sugar'

%w[ 'curl' 'git' ].each do |pkg|
  package pkg
end
