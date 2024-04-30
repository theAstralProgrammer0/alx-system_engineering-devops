# This puppet manifest automates creating a custom HTTP header response for web servers

file {'append header'
  ensure => present,
  path => /etc/nginx/sites-enabled/default,
  content => '\n\tadd_header X-Served-By $hostname;'
}
