# This is a puppet manifest that automates ssh configuration
$sshd = "/home/ubuntu/.ssh/"
$sshcf = "/home/ubuntu/.ssh/config"

file { $sshd:
	ensure => directory,
	mode => '0700',
}

file { $sshcf:
	ensure => file,
	mode => '0600',
	content => "
		Host *
			PasswordAuthentication no
			IdentityFile ~/.ssh/school
		",
}

