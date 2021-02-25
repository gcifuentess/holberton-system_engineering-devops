# fix Security limits
exec { 'Fix hard limit':
  command => '/usr/bin/env sed -i s/"holberton hard nofile 4"/"holberton hard nofile 30000"/ /etc/security/limits.conf'
}

exec { 'Fix soft limit':
  command => '/usr/bin/env sed -i s/"holberton soft nofile 5"/"holberton soft nofile 30000"/ /etc/security/limits.conf'
}
