# fix Nginx web server - File descriptors limit
exec { 'Fix_limit':
  command => '/usr/bin/env sed -i s/15/4096/ /etc/default/nginx',
  before  => Exec['Restart_Nginx']
}

exec { 'Restart_Nginx':
  command => '/usr/bin/env service nginx restart',
}
