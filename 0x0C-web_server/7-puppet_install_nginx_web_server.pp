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
  command => 'sudo sed -i "s/server_name _;/server_name _;\n\trewrite ^\/redirect_me https:\/\/www.youtube.com\/watch?v=QH2-TGUlwu4 permanent;/" /etc/nginx/sites-enabled/default',
  provider => shell,
}

exec {'Restart Nginx':
  command => 'sudo service nginx restart',
  provider => shell,
}
