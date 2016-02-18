node 'spine1.lab.local' {
    $int_enabled = true
    $int_loopback = '3.3.3.3'
    $int_unnumbered = [ 'swp1', 'swp2', 'swp3', 'swp4', 'swp5', 'swp6' ]
    include ospfunnum::role::switchbase
    include mcollective::client
}

node 'spine2.lab.local' {
    $int_enabled = true
    $int_loopback = '4.4.4.4'
    $int_unnumbered = [ 'swp1', 'swp2', 'swp3', 'swp4', 'swp5', 'swp6' ]
    include ospfunnum::role::switchbase
}

node 'spine3.lab.local' {
    $int_enabled = true
    $int_loopback = '5.5.5.5'
    $int_unnumbered = [ 'swp1', 'swp2', 'swp3', 'swp4', 'swp5', 'swp6' ]
    include ospfunnum::role::switchbase
}

node 'spine4.lab.local' {
    $int_enabled = true
    $int_loopback = '6.6.6.6'
    $int_unnumbered = [ 'swp1', 'swp2', 'swp3', 'swp4', 'swp5', 'swp6' ]
    include ospfunnum::role::switchbase
}

node 'edge1.lab.local' {
    $int_enabled = true
    $int_loopback = '1.1.1.1'
    $int_unnumbered = [ 'swp1', 'swp2', 'swp3', 'swp4' ]
    include ospfunnum::role::switchbase
}

node 'edge2.lab.local' {
    $int_enabled = true
    $int_loopback = '2.2.2.2'
    $int_unnumbered = [ 'swp1', 'swp2', 'swp3', 'swp4' ]
    include ospfunnum::role::switchbase
}

node 'leaf1.lab.local' {
    $int_enabled = true
    $int_loopback = '7.7.7.7'
    $int_unnumbered = [ 'swp1', 'swp2', 'swp3', 'swp4' ]
    $int_bridges = { 'br0' =>
        { 'id'      => 'br0',
          'address' => '11.11.11.10',
          'netmask' => '31',
          'members' => ['swp5'] },
    }
    include ospfunnum::role::switchbase
}

node 'leaf2.lab.local' {
    $int_enabled = true
    $int_loopback = '8.8.8.8'
    $int_unnumbered = [ 'swp1', 'swp2', 'swp3', 'swp4' ]
    $int_bridges = { 'br0' =>
        { 'id'      => 'br0',
          'address' => '11.11.11.10',
          'netmask' => '31',
          'members' => ['swp5'] },
    }
    include ospfunnum::role::switchbase
}

node 'leaf3.lab.local' {
    $int_enabled = true
    $int_loopback = '9.9.9.9'
    $int_unnumbered = [ 'swp1', 'swp2', 'swp3', 'swp4' ]
    $int_bridges = { 'br0' =>
        { 'id'      => 'br0',
          'address' => '12.12.12.13',
          'netmask' => '31',
          'members' => ['swp5'] },
    }
    include ospfunnum::role::switchbase
}

node 'leaf4.lab.local' {
    $int_enabled = true
    $int_loopback = '9.9.9.9'
    $int_unnumbered = [ 'swp1', 'swp2', 'swp3', 'swp4' ]
    $int_bridges = { 'br0' =>
        { 'id'      => 'br0',
          'address' => '12.12.12.13',
          'netmask' => '31',
          'members' => ['swp5'] },
    }
    include ospfunnum::role::switchbase
}
