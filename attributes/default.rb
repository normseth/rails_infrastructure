default['rails_infrastructure']['app_db_user']['name'] = 'foo'
# TODO: Get password out of cookbook
default['rails_infrastructure']['app_db_user']['password'] = 'foobar'
default['rails_infrastructure']['app_db_user']['env'] = 'test'


default['rvm']['default_ruby'] = 'ruby-2.0.0-p481'

# Create gemset but leave empty.  To be populated by deployment recipe
# TODO: Reconsider the way this is split between recipes
default['rvm']['gems'] = {
  "#{node['rvm']['default_ruby']}@railstutorial_rails_4_0" => []
}
