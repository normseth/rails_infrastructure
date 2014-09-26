include_recipe 'chef-sugar'
include_recipe 'runit'

directory node['rails_infrastructure']['deployment']['dir'] do
  action :create
  recursive true
end

microblog_creds = encrypted_data_bag_item_for_environment('creds', 'microblog_creds')

# Unable to pass the following directly to database sub-resource for some reason
dbadapter = node['rails_infrastructure']['dbadapter']
dbname = "#{node['rails_infrastructure']['app']['name']}_#{node.chef_environment}"
dbhost = node['rails_infrastructure']['dbhost']
dbusername = microblog_creds['microblog_dbuser']
dbuserpass = microblog_creds['microblog_dbpass']

application node['rails_infrastructure']['app']['name'] do

  path node['rails_infrastructure']['deployment']['dir']
  owner node['rails_infrastructure']['owner']
  group node['rails_infrastructure']['group']
  repository node['rails_infrastructure']['app']['repo']
  deploy_key microblog_creds['jenkins_github_private_key']
  #revision
  environment_name node.chef_environment
  migrate true
  migration_command 'bundle exec rake db:migrate'
  rollback_on_error true

  rails do

    bundler true
    bundler_deployment true

    database do
      adapter dbadapter
      database dbname
      host dbhost
      username dbusername
      password dbuserpass
    end

  end

  unicorn do
    bundler true
  end


end
