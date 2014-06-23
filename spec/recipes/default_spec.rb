require 'spec_helper'

describe 'et_landing_pages_app::default' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      # Create a new environment
      env = Chef::Environment.new
      env.name 'prod'

      # Stub the node to return this environment
      allow(node).to receive(:chef_environment).and_return(env.name)

      # Stub any calls to Environment.load to return this environment
      allow(Chef::Environment).to receive(:load).and_return(env)
    end.converge(described_recipe)
  end

  before do
    stub_data_bag_item('endpoints', 'rds').and_return(
      id: 'rds',
      prod: {
        landing_pages: {
          host: 'prod-etdb',
          schema_name: 'landing_pages'
        }
      }
    )

    allow(Chef::EncryptedDataBagItem).to receive(:load).with('secrets', 'database_credentials').and_return(
      'prod' => {
        'landing_pages' => {
          'username' => 'landing_pages',
          'password' => 'password'
        }
      }
    )

    allow(Chef::EncryptedDataBagItem).to receive(:load).with('secrets', 'aws_credentials').and_return(
      'RailsDeploy-prod' => {
        'access_key_id' => 'AAAAAAAAAAAAAAAAAAAA',
        'secret_access_key' => 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
      }
    )

    stub_command('which nginx').and_return('/usr/sbin/nginx')
  end

  it 'includes et_rails_app' do
    expect(chef_run).to include_recipe('et_rails_app')
  end
end
