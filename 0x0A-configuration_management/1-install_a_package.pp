# Install an especific version of flask (2.1.0) from pip
package { 'Werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
  name     => 'Werkzeug',
}
package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  name     => 'flask',
}
