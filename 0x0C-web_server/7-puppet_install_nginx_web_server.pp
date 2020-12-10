# Install Nginx web server (w/ Puppet)

package { 'nginx':
  ensure => 'installed',
  name   => 'nginx',
}

file { '/var/www/html/index.hmtl':
  content => 'Holberton School',
}

file_line { '/etc/nginx/sites-available/default':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'server_name _',
  line   => "\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;",
}

service { 'nginx':
  ensure  => 'running',
  require => Package['nginx'],
}
