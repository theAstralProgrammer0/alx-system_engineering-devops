# puppet manifes to reduce failed requests

$file = '/etc/default/nginx/'

exec { 'search_and_replace':
  command => "sed -i 's/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/g' ${file}",
  path    => ['/bin', '/usr/bin']
}

-> exec { 'restart_nginx':
  command => 'service nginx restart',
  path    => ['/bin', '/usr/bin']
  }
