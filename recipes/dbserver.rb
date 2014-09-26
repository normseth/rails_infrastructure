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

microblog_creds = encrypted_data_bag_item_for_environment('creds', 'microblog_creds')
postgresql_database_user microblog_creds['microblog_dbuser'] do
  connection connection_info
  password microblog_creds['microblog_dbpass']
  database_name dbname
  action [ :create, :grant ]
end
