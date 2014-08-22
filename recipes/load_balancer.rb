include_recipe 'rails_infrastructure::common'
include_recipe 'nginx'

# TODO: Fix the following.  It is very fragile.
preferred_local_ip = node['network']['interfaces']['eth1']['addresses'].keys[1]

# TODO: Fix the template source -- it assumes we're just passing a single IP address
template "#{node['nginx']['dir']}/conf.d/app.conf" do
  source 'lb.conf.erb'
  variables(
    :localip => preferred_local_ip
  )
end
