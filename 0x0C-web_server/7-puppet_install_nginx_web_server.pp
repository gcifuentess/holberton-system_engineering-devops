# Install Nginx web server (w/ Puppet)

exec { 'apt-get_update':
    command => 'apt-get update -y',
    path    => '/usr/bin/',
}

exec { 'install_nginx':
    command => 'apt-get install nginx -y',
    path    => '/usr/bin/',
}

file {'/var/www/html/index.html':
    ensure  => 'file',
    owner   => 'ubuntu',
    group   => 'ubuntu',
    content => 'Holberton School',
    mode    => '0644',
}

exec { 'redirect':
    command => 'sed -i "/server_name _;/ a \\\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
    path    => '/bin/',
}

service { 'start_nginx':
    ensure => 'running',
    name   => 'nginx',
}
