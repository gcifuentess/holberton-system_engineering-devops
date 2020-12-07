# Install a package
exec {'puppet-lint':
    command => 'gem install puppet-lint -v 2.1.1',
    path    => '/usr/bin/',
}
