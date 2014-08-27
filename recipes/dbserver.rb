include_recipe 'rails_infrastructure::common'
include_recipe 'postgresql::server'
include_recipe 'postgresql::ruby'

connection_info = {:host => node['rails_infrastructure']['dbhost'],
                  :port => node['postgresql']['config']['port'],
                  :username => 'postgres'}

dbname = "#{node['rails_infrastructure']['app_db_user']['name']}_#{node['rails_infrastructure']['environment']}"

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
