# Install Nginx web server (w/ Puppet)

exec { 'update':
  command => 'sudo apt-get update -y',
  path    => ['/usr/bin', '/bin/'],
  returns => [0, 1],
  before  => Package['nginx'],
}

package { 'nginx':
  ensure => 'installed',
  name   => 'nginx',
}

file { '/var/www/html/index.html':
  content => 'Holberton School',
}

file_line { '/etc/nginx/sites-enabled/default':
  ensure => 'present',
  path   => '/etc/nginx/sites-enabled/default',
  after  => 'server_name _',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

service { 'nginx':
  ensure  => 'running',
  require => Package['nginx'],
}
