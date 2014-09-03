include_recipe 'apt'
include_recipe 'chef-sugar'

# Note re: %w -- words can be in quotes and ruby/chef are happy, but chefspec fails unless bareword
%w[ curl git ].each do |pkg|
  package pkg
end
