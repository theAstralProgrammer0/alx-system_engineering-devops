# This puppet manifest automates creating a custom HTTP header response for web servers

exec { 'add_custom_header':
  command  => "sed -i 's/server_name _;/server_name _;\\n\\tadd_header X-Served-By $hostname;/' /etc/nginx/sites-enabled/default",
  provider => 'shell',
}

exec { 'restart':
  command => 'service nginx restart',
  provider => 'shell',
}
