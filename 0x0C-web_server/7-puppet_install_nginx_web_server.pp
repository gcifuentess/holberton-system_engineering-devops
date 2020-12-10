# Install Nginx web server (w/ Puppet)

package { 'nginx':
  ensure => 'installed',
}

exec { 'index.html':
  command => '/usr/bin/sudo /bin/echo Holberton School > /var/www/html/index.html',
}

file_line { '/etc/nginx/sites-available/default':
  ensure => 'present',
  after  => 'server_name _',
  line   => "\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;",
}

service { 'nginx':
  ensure => 'running',
}
