class base::puppet {
  package { 'puppet':
    ensure => present
  }
  service { 'puppet':
    ensure  => running,
    enable  => true,
    require => Package['puppet']
  }
}
