require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

%w[ postgresql-9.1 libpq-dev ].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
