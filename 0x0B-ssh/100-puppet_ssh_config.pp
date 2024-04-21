# This is a puppet manifest that automates ssh configuration
$sshd = "~/.ssh"
$sshcf = "~/.ssh/config"

file { $sshd:
	ensure => directory,
	mode => '0700',
	owner => $::environment['USER'],
	group => $::environment['USER'],
}

file { $sshcf:
	ensure => file,
	mode => '0600',
	owner => $::environment['USER'],
	group => $::environment['USER'],
	content => "
		Host *
			PasswordAuthentication no
			IdentityFile ~/.ssh/school
		",
}

