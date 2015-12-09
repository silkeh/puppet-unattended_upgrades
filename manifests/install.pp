# Install requirements for unattended-upgrades
class unattended_upgrades::install {
  include ::unattended_upgrades::params

  package { $::unattended_upgrades::params::packages: ensure => 'installed' }
}
