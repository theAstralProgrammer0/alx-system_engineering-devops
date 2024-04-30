# This puppet manifest automates creating a custom HTTP header response for web servers

exec { 'update':
  command: 'apt-get update',
  provider: shell
}


file_line { 'add_header':
  ensure => present,
  path => '/etc/nginx/sites-enabled/default',
  match => 'server_name _;'
  line => '\n\tadd_header X-Served-By $hostname;',
}

exec { 'restart':
  command: 'service nginx restart',
  provider: shell
}
