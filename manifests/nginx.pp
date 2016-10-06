class nginx {
  package { 'nginx':
    ensure => latest
  }
  service { 'nginx':
    ensure => running,
    enable => true,
    require => Package['nginx']
  }
  nginx::resource::vhost { 'my.localhost.com':
    listen_port => 8888,
    proxy       => 'http://localhost:8080',
}
}
