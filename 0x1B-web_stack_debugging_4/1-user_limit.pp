# Define user 'holberton'
user { 'holberton':
  ensure     => present,
  managehome => true,
  shell      => '/bin/bash',
}

# Set limits for user 'holberton'
file { '/etc/security/limits.d/holberton.conf':
  ensure  => present,
  content => "holberton soft nofile 65536\nholberton hard nofile 65536",
}
