# Ensure the puppetlabs-stdlib module is installed
# This can be installed via the Puppet Forge: puppet module install puppetlabs-stdlib

file_line { 'fix-wp-locale-extension':
  path  => '/var/www/html/wp-settings.php',
  line  => "require_once( ABSPATH . WPINC . '/class-wp-locale.php' );",
  match => '^require_once\( ABSPATH \. WPINC \. \'/class-wp-locale\.phpp\' \);$',
}

