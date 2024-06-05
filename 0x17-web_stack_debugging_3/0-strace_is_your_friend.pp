# Puppet manifest to debug apache web stack

class replace_wp_locale {
  
  $config_file = '/var/www/html/wp-settings.php'
  $line_before = 'require_once( ABSPATH . WPINC . \'/l10n.php\' );'
  $line = 'require_once( ABSPATH . WPINC . \'/class-wp-locale.phpp\' );'

  exec { 'replace_line_in_wp_settings':
    command => "sed -i 's|${line_before}|${line}|g' ${config_file}",
    onlyif  => "grep -q '${line_before}' ${config_file}",
    path    => '/bin:/usr/bin',
  }

  service { 'apache2':
    ensure  => running,
    enable  => true,
    require => Exec['replace_line_in_wp_settings'],
  }
}
