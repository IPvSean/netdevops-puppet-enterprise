class base::ptm {
    service { 'ptmd':
        ensure     => running,
        hasrestart => true,
        enable     => true
    }

    file { '/etc/ptm.d/topology.dot':
        owner  => root,
        group  => root,
        mode   => '0644',
        source => 'puppet:///modules/base/topology.dot',
        notify => Service['ptmd']
    }
}
