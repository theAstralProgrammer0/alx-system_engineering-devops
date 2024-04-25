# This puppet manifest automates nginx web server installation, adds redirection, and handles 404 errors

package {'nginx':
  ensure => 'present',
}

exec {'Install Nginx':
  command => 'sudo apt-get update; sudo apt-get -y install nginx',
  provider => shell,
}

exec {'Allow Firewall':
  command => 'sudo ufw allow "Nginx HTTP"',
  provider => ubuntu,
}

exec {'Populate index.html File(s)':
  command => 'echo "Hello World!" | sudo tee /var/www/html/index.html',
  provider => shell,
}

exec {'301 Moved Permanently':
  command => 'sudo sed -i "s/listen 80 default_server;/listen 80 default_server;\\n\\tlocation \/redirect_me {\\n\\t\\treturn 301 https:\/\/blog.ehoneahobed.com\/;\\n\\t}/" /etc/nginx/sites-available/default',
  provider => shell,
}

exec {'Restart Nginx':
  command => 'sudo service nginx restart',
  provider => shell,
}
