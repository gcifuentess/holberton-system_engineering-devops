# Install Nginx web server (w/ Puppet)

exec { 'apt-get_update':
    command => '/usr/bin/sudo /usr/bin/apt-get update -y',
}

exec { 'install_nginx':
    command => '/usr/bin/sudo /usr/bin/apt-get install nginx -y',
}

exec { 'index.html':
    command => '/usr/bin/sudo /bin/echo Holberton School > /var/www/html/index.html',
}

exec { 'redirect':
    command => '/usr/bin/sudo /bin/sed -i "/server_name _;/ a \\\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
}

exec {'start_nginx':
    command => '/usr/bin/sudo /usr/sbin/service nginx start',
}
