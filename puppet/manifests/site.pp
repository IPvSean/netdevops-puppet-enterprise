node 'spine1.lab.local' {
    $int_enabled = true
    $int_loopback = '10.2.1.3'
    $int_unnumbered = [ 'swp49', 'swp50', 'swp51', 'swp52' ]
    $int_bridges = [ ]
    include ospfunnum::role::switchbase
}

node 'spine2.lab.local' {
    $int_enabled = true
    $int_loopback = '10.2.1.4'
    $int_unnumbered = [ 'swp49', 'swp50', 'swp51', 'swp52' ]
    $int_bridges = [ ]
    include ospfunnum::role::switchbase
}

node 'leaf1.lab.local' {
    $int_enabled = true
    $int_loopback = '10.2.1.1'
    $int_unnumbered = [ 'swp1s0', 'swp1s1', 'swp1s2', 'swp1s3' ]
    $int_bridges = [
        { 'id'      => 'br0',
          'address' => '10.4.1.1',
          'netmask' => '25',
          'members' => ['swp32s0'] },
        { 'id' => 'br1',
          'address' => '10.4.1.129',
          'netmask' => '25',
          'members' => ['swp32s1'] }
    ]
    include ospfunnum::role::switchbase
    class { 'portsconf' :
      switchtype => '40G',
      stage      => 'setup',
    }
}

node 'leaf2.lab.local' {
    $int_enabled = true
    $int_loopback = '10.2.1.2'
    $int_unnumbered = [ 'swp1s0', 'swp1s1', 'swp1s2', 'swp1s3' ]
    $int_bridges = [
        { 'id'      => 'br0',
          'address' => '10.4.2.1',
          'netmask' => '25',
          'members' => ['swp32s0'] },
        { 'id'      => 'br1',
          'address' => '10.4.2.129',
          'netmask' => '25',
          'members' => ['swp32s1'] }
    ]
    include ospfunnum::role::switchbase
    class { 'portsconf' :
      switchtype => '40G',
      stage      => 'setup',
    }
}
