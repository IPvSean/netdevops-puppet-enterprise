class ospfunnum::quagga {
    service { 'quagga':
        ensure    => running,
        hasstatus => false,
        enable    => true,
        subscribe => Service['networking'],
    }

    file { '/etc/quagga/daemons':
        owner  => quagga,
        group  => quagga,
        source => 'puppet:///modules/ospfunnum/quagga_daemons',
        notify => Service['quagga']
    }

    file { '/etc/quagga/Quagga.conf':
        owner   => root,
        group   => quaggavty,
        mode    => '0644',
        content => template('ospfunnum/Quagga.conf.erb'),
        notify  => Service['quagga']
    }
}
