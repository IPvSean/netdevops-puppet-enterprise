class base::ntpclient {
  $servers = ['0.north-america.pool.ntp.org','3.north-america.pool.ntp.org']
  $ntp_server = false

  file { '/etc/ntp.conf':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('base/ntp.conf.erb'),
  }

  package { 'ntp':
    ensure => installed,
    before => File['/etc/ntp.conf'],
  }

  service { 'ntp':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/ntp.conf'],
  }
}
