# Ensure the puppetlabs-stdlib module is installed

$file = '/var/www/html/wp-settings.php'

exec { 'search_and_replace':
  command => "sed -i 's/phpp/php/g' ${file}",
  path    => ['/bin', '/usr/bin']
}
