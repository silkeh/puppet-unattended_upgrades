# Class for enabling and configuring unattended-upgrades
class unattended_upgrades(
  $allowed_origins            = $::unattended_upgrades::params::allowed_origins,
  $package_blacklist          = [],
  $autofixinterrupteddpkg     = undef,
  $minimalstep                = undef,
  $mail                       = $::unattended_upgrades::params::mail,
  $installonshutdown          = undef,
  $mailonlyonerror            = undef,
  $remove_unused_dependencies = undef,
  $automatic_reboot           = undef,
  $automatic_reboot_time      = undef,
  $http_dl_limit              = undef,
  $update_package_list        = $::unattended_upgrades::params::update_package_list,
  $unattended_upgrade         = $::unattended_upgrades::params::unattended_upgrade,
  $autocleaninterval          = undef,
) {
  include ::unattended_upgrades::params

  file {'20auto-upgrades':
    ensure  => file,
    path    => $::unattended_upgrades::params::auto_upgrades_f,
    content => epp('unattended_upgrades/unattended_upgrades.epp'),
    owner   => root,
    group   => root,
    mode    => 'u=rwX,go=rX',
  }

  file {'50unattended-upgrades':
    ensure  => file,
    path    => $::unattended_upgrades::params::unattended_upgrades_f,
    content => epp('unattended_upgrades/unattended_upgrades.epp'),
    owner   => root,
    group   => root,
    mode    => 'u=rwX,go=rX',
  }

}
