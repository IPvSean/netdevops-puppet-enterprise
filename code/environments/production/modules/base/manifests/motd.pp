class base::motd {
    file { '/etc/motd':
        owner   => root,
        group   => root,
        mode    => '0644',
        content => template('base/motd.erb')
    }
}
