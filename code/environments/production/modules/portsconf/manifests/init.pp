class portsconf ($switchtype='') {
  if $switchtype == '40G' {
    cumulus_ports { 'speeds':
      speed_4_by_10g => ['swp1', 'swp32'],
      speed_40g      => ['swp2-31'],
      notify         => Service['switchd'],
    }
  }
}
