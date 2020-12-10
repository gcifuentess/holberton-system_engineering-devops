# install Nginx web server (w/ Puppet)

exec { 'apt-get_update':
  command => '/usr/bin/sudo /usr/bin/apt-get update -y',
  before  => Package['nginx'],
}

package { 'nginx':
  ensure  => 'installed',
  name    => 'nginx',
  require => Exec['apt-get_update'],
}

file { '/var/www/html/index.html':
  content => "Holberton School\n",
  require => Package['nginx'],
}

file_line { '/etc/nginx/sites-available/default':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  after   => 'server_name _',
  line    => "\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;",
  require => File['/var/www/html/index.html']
}

service { 'nginx':
  ensure  => 'running',
  require => File_line['/etc/nginx/sites-available/default'],
}
