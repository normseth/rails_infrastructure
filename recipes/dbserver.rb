include_recipe 'rails_infrastructure::common'

# Directly invoking packages rather than using community postgresql cookbook.
# That one seems more complex than needed and has several caveats in the readme.
# TODO: Revisit decision to use package directly for postgresql install.

# %w[ 'postgresql' 'libpq-dev' ].each do |pkg|
#   package pkg
# end
# chef_gem 'pg'

include_recipe 'postgresql::server'
include_recipe 'postgresql::ruby'

connection_info = {:host => "localhost",
                  :port => node['postgresql']['config']['port'],
                  :username => 'postgres'}

dbname = "#{node['rails_infrastructure']['app_db_user']['name']}_#{node['rails_infrastructure']['env']}"

postgresql_database dbname do
  connection connection_info
  action :create
end

postgresql_database_user node['rails_infrastructure']['app_db_user']['name'] do
  connection connection_info
  password node['rails_infrastructure']['app_db_user']['password']
  database_name dbname
  action [ :create, :grant ]
end
