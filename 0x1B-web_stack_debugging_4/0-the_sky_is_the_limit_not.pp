# puppet manifes to reduce failed requests

exec { 'search_and_replace':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/'
}

exec { 'restart_nginx':
  command => 'nginx restart',
  path    => '/etc/init.d/'
}
