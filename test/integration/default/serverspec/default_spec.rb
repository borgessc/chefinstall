require 'spec_helper'

describe 'icingamon::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  it 'does something' do
    skip 'Replace this with meaningful tests'
  end
end


describe package ('icinga2') do
  it { should be_installed }
end

describe ppa('formorer/icinga') do
  it { should exist }
end

describe ppa('formorer/icinga') do
  it { should be_enabled }
end

describe 'Iginga features' do
  describe command ("icinga2 feature list") do
    its (:stdout ) { should match /"Enabled features" : checker mainlog notification/ }
  end

  describe service('icinga2') do
  it { should be_enabled }

end
