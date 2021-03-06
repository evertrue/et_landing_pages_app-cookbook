set['nginx']['default_site_enabled'] = false
set['nginx']['socketproxy']['default_app'] = 'landing_pages'
set['nginx']['socketproxy']['apps'] = {
  'landing_pages' => {
    'prepend_slash' => false,
    'context_name' => '',
    'subdir' => 'current',
    'socket' => {
      'type' => 'tcp',
      'port' => '9090'
    }
  }
}

set['et_rails_app']['db']['source_name'] = 'landing_pages'
