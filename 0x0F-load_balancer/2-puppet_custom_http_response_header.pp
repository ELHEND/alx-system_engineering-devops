class nginx::custom_http_header {

  package { 'nginx': ensure => present }

  service { 'nginx': ensure => running }

  file { '/etc/nginx/nginx.conf':
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => template('nginx/nginx.conf.erb'),
    notify => Service['nginx'],
  }

  template('nginx/nginx.conf.erb') {
    source => 'nginx/nginx.conf.erb'

    variables => {
      custom_http_header => 'X-Served-By',
    }
  }

}

