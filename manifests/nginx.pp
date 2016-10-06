  class {
    'nginx':;
  }
  nginx::Proxy {
    ensure => present,
    enable => true,
  }

  nginx::proxy {
    'localhost': server_name => 'localhost', proxy_pass => 'http://127.0.0.1:8080';
  }
