include_recipe 'rails_infrastructure::common'
include_recipe 'postgresql::server'
include_recipe 'postgresql::ruby'

connection_info = {:host => node['rails_infrastructure']['dbhost'],
                  :port => node['postgresql']['config']['port'],
                  :username => 'postgres'}

dbname = "#{node['rails_infrastructure']['app']['name']}_#{node.chef_environment}"

postgresql_database dbname do
  connection connection_info
  action :create
end

db_creds = encrypted_data_bag_item_for_environment('creds', 'db_creds')
postgresql_database_user db_creds['microblog_ruby_dbuser'] do
  connection connection_info
  password db_creds['microblog_ruby_dbpass']
  database_name dbname
  action [ :create, :grant ]
end
