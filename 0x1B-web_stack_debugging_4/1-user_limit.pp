# fix Security limits
exec { 'Fix hard limit':
  command => '/usr/bin/env sed -i "s/4/30000/; s/5/30000/" /etc/security/limits.conf'
}
