# This is a puppet manifest that automates ssh configuration
file {	'Turn off password authentication':
	ensure => 'present',
	path => '/etc/ssh/ssh_config',
	content => "
		Host *
			PasswordAuthentication no
			IdentityFile ~/.ssh/school
		   ",
}	
