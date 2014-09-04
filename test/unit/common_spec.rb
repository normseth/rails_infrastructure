require_relative '../spec_helper.rb'

describe 'rails_infrastructure::common' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs git' do
    expect(chef_run).to install_package('git')
  end

  it 'installs curl' do
    expect(chef_run).to install_package('curl')
  end

end
