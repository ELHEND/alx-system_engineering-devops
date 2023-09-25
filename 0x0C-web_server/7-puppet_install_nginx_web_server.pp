class nginx {

  # Install the Nginx package
  package { 'nginx':
    ensure => installed,
  }

  # Configure Nginx to listen on port 80
  service { 'nginx':
    ensure => running,
    enable  => true,
    listen_ports => [80],
  }

  # Create a default file for the Nginx root directory
  file { '/var/www/html/index.html':
    ensure  => present,
    content => 'Hello World!',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Create a redirect for /redirect_me/
  nginx::location { '/redirect_me/':
    return => 301,
    url   => 'https://www.youtube.com/watch?v=QH2-TGUlwu4',
  }
}

