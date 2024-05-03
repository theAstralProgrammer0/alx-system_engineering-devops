# This puppet manifest automates adding a custom HTTP header response to nginx web servers

exec {'update':
  command => 'apt-get update',
}
-> package {'nginx':
  ensure => 'present',
}
-> file_line { 'add http_header':
  path  => '/etc/nginx/nginx.conf',
  match => 'http {',
  after => 'http {',
  line  => "\n\tadd_header X-Served-By \"${hostname}\";",
}
-> exec {'restart':
  command => 'service nginx restart',
}
