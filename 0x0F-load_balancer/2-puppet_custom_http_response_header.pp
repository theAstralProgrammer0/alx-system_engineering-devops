# This puppet manifest automates creating a custom HTTP header response for web servers

exec {'update':
  command => 'apt-get update',
}

package {'nginx':
  ensure => 'present',
}

file_line { 'add http_header':
  path  => '/etc/nginx/nginx.conf',
  match => 'http {',
  line  => "http {\n\tadd_header X-Served-By \"${hostname}\";",
}

exec {'restart':
  command => 'service nginx restart',
}
