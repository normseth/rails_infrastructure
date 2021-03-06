require 'spec_helper'

# OS user exists
# Packages installed

%w[ postgresql-9.1 libpq-dev ].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# Gems installed
# Listen on port
# Database created
# Database user created
