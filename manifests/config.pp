# Configuration files for unattended upgrades
class unattended_upgrades::config inherits unattended_upgrades {

  file {'20auto-upgrades':
    ensure  => file,
    path    => $::unattended_upgrades::params::auto_upgrades_f,
    content => epp('unattended_upgrades/auto_upgrades.epp'),
    owner   => root,
    #group   => root,
    mode    => 'u=rw,go=r',
  }

  file {'50unattended-upgrades':
    ensure  => file,
    path    => $::unattended_upgrades::params::unattended_upgrades_f,
    content => epp('unattended_upgrades/unattended_upgrades.epp'),
    owner   => root,
    #group   => root,
    mode    => 'u=rw,go=r',
  }

}
