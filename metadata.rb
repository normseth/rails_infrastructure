name             'rails_infrastructure'
maintainer       'Level 11'
maintainer_email 'nikormseth@level11.com'
license          ''
description      'Installs/Configures rails_infrastructure'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'apt'
depends 'nginx'
depends 'chef-sugar'
depends 'rvm'
depends 'postgresql'
depends 'database'
