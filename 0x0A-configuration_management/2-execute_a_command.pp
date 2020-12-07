# Execute a command
exec {  'kills-killmenow':
  command => 'pkill killmenow',
  path    => '/usr/bin/',
}
