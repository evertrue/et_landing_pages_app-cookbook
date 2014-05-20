name             'et_landing_pages_app'
maintainer       'EverTrue, Inc.'
maintainer_email 'devops@evertrue.com'
license          'All rights reserved'
description      'Installs/Configures et_landing_pages_app'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.6'

depends 'et_rails_app', '= 5.0.1'
depends 'et_users',     '>= 1.4.1'
depends 'apt'
