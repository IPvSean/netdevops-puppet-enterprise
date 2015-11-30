class base::interfaces {

  # Wrapper classes for Layer 3 interfaces and Bridges
  #
  # Classes must be defined "at the top level" which is why they're here,
  # rather than inside the if() block below, where they are called from.

  define base_l3_interface {
    $address = $name["address"]
    $netmask = $intf["netmask"]

    cumulus_interface { $name:
      ipv4   => "$address/$netmask",
      notify => Service['networking'],
    }
  }

  define base_bridge ($id, $address, $netmask, $members) {
    #$id = $name["id"]
    #$address = $name["address"]
    #$netmask = $name["netmask"]
    #$members = $name["members"]

    cumulus_bridge{ $id:
      ipv4   => "$address/$netmask",
      ports  => $members,
      notify => Service['networking'],
    }
  }

  if $int_enabled == undef {
      $int_enabled = false
  }

  if ($int_enabled == true) {
    cumulus_interface { 'lo':
      addr_method => 'loopback',
      ipv4 => "$int_loopback/32",
    }

    cumulus_interface { 'eth0':
      addr_method => 'dhcp',
    }

    # unnumbered interfaces
    if ($int_unnumbered != undef) {
      cumulus_interface { $int_unnumbered:
        ipv4   => "$int_loopback/32",
        notify => Service['networking'],
      }
    }

    # l3 interfaces
    if ($int_layer3 != undef) {
      base_l3_interface{ $int_layer3: }
    }

    # bridges
    if ($int_bridges != undef) {
      create_resources( base::interfaces::base_bridge, $int_bridges )
      #base_bridge{ $int_bridges: }
    }

    # Replace the interfaces file with one that includes the fragments
    file { '/etc/network/interfaces':
      content => "# This file is managed by Puppet\nsource /etc/network/interfaces.d/*\n"
    }

    service { 'networking':
      ensure     => running,
      hasrestart => true,
      restart    => '/sbin/ifreload -a',
      enable     => true,
      hasstatus  => false,
    }
  }
}
