class base::license {

  service { 'switchd':
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true
  }

  cumulus_license { 'workbench':
    src => "http://wbench.lab.local/${::hostname}.lic",
    notify => Service['switchd']
  }

}
