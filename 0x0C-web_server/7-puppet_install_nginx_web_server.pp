# install Nginx web server (w/ Puppet)

exec { 'apt-get_update':
    command => '/usr/bin/sudo /usr/bin/apt-get update -y',
    before  => Exec['install_nginx'],
}

exec { 'install_nginx':
    command => '/usr/bin/sudo /usr/bin/apt-get install nginx -y',
    before  => Exec['index.html'],
}

exec { 'index.html':
    command => '/usr/bin/sudo /bin/echo Holberton School > /var/www/html/index.html',
    before  => Exec['exec_3'],
}

exec { 'exec_3':
  require     => Exec['index.html'],
  environment => ['GG=google.com permanent'],
  command     => 'sudo sed -i "s/server_name _;/server_name _;\n\trewrite ^\/redirect_me $GG;/" /etc/nginx/sites-enabled/default',
  path        => ['/usr/bin', '/bin'],
  returns     => [0,1]
}

exec {'start_nginx':
    command => '/usr/bin/sudo /usr/sbin/service nginx start',
}
