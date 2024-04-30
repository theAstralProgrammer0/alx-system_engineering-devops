# This puppet manifest automates creating a custom HTTP header response for web servers

file_line {'add_header':
  ensure => present,
  path => '/etc/nginx/sites-enabled/default',
  line => '\n\tadd_header X-Served-By $hostname;',
  match => '^server_name _;',
  after => '^server_name _;',
}
