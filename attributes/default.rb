override['apt']['compile_time_update'] = true

default['rails_infrastructure']['app']['name'] = 'microblog_ruby'
default['rails_infrastructure']['dbadapter'] = 'postgresql'
default['rails_infrastructure']['dbhost'] = 'localhost'
default['rails_infrastructure']['deployment']['dir'] = '/usr/local/deploy'
default['rails_infrastructure']['app']['repo'] = 'git@github.com:normseth/microblog_ruby.git'
default['rails_infrastructure']['owner'] = 'vagrant'
default['rails_infrastructure']['group'] = 'vagrant'

default['rvm']['default_ruby'] = 'ruby-2.0.0-p481'

default['rvm']['global_gems'] = [
  { 'name'    => 'bundler' },
  { 'name'    => 'rake', 'version' => '10.3.2'},
  { 'name'    => 'rubygems-bundler', 'action'  => 'remove' }
]
