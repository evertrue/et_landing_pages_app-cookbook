require 'spec_helper'

%w(
  libmagickcore-dev
  libmagickwand-dev
).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe user('deploy') do
  it { should exist }
end

describe file('/etc/nginx/sites-enabled/socketproxy.conf') do
  it { should be_linked_to '/etc/nginx/sites-available/socketproxy.conf' }
end

describe file('/etc/nginx/sites-available/socketproxy.conf') do
  its(:content) { should match(%r(root .*/landing_pages/.*)) }
end

describe service('nginx') do
  it { should be_enabled }
end

describe process('nginx') do
  its(:args) { should match(%r(master process /usr/sbin/nginx)) }
end

describe port(8080) do
  it { should be_listening.with('tcp') }
end
