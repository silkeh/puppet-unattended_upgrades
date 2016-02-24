# Class for enabling and configuring unattended-upgrades
class unattended_upgrades(
  $origins                    = $::unattended_upgrades::params::origins,
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
) inherits unattended_upgrades::params {

  anchor { 'unattended_upgrades::begin': } ->
  class { 'unattended_upgrades::install': } ->
  class { 'unattended_upgrades::config': } ->
  anchor { 'unattended_upgrades::end': }
}
