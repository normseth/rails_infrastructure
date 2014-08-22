#
# Cookbook Name:: rails_infrastructure
# Recipe:: default
#
# Copyright 2014, Level 11
#

# Default behavior is to put entire stack on one node.

include_recipe 'rails_infrastructure::common'
include_recipe 'rails_infrastructure::load_balancer'
include_recipe 'rails_infrastructure::appserver'
include_recipe 'rails_infrastructure::dbserver'
