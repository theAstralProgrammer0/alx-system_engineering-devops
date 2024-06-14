# Puppet manifest to debug apache web stack

$file = '/var/www/html/wp-settings.php'

exec { 'search_and_replace':
  command => "sed -i 's/phpp/php/g' ${file}",
  path    => ['/bin', '/usr/bin']
}
