# This puppet manifest automates creating a custom HTTP header response for web servers

file_line { 'add_custom_header':
  path    => '/etc/nginx/nginx.conf',
  line    => '\n\tadd_header X-Served-By $hostname;',
  match   => '^http {',
  ensure  => present,
  require => Package['nginx'],
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure => running,
  enable => true,
}

exec { 'restart':
  command: 'service nginx restart',
  provider: shell
}
