# Entries in this file to support both ChefSpec and ServerSpec

require 'serverspec'
require 'net/ssh'
require 'chefspec'
require 'fauxhai'

at_exit { ChefSpec::Coverage.report! }

include Serverspec::Helper::Ssh
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.host  = ENV['TARGET_HOST']
  options = Net::SSH::Config.for(c.host)
  user    = options[:user] || Etc.getlogin
  c.ssh   = Net::SSH.start(c.host, user, options)
  c.os    = backend.check_os
end
