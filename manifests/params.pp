# Parameters for unattended-upgrades
class unattended_upgrades::params {

  # Packages that are required
  $packages = $::lsbdistid ? {
    'debian' => ['unattended-upgrades'],
    default  => ['unattended-upgrades'],
  }

  # Config location
  $apt_conf_d = $::lsbdistid ? {
    'debian' => '/etc/apt/apt.conf.d',
    default  => '/etc/apt/apt.conf.d',
  }

  # Other parameters
  $mail                  = 'root'
  $unattended_upgrades_f = "${apt_conf_d}/50unattended-upgrades"
  $auto_upgrades_f       = "${apt_conf_d}/20auto-upgrades"
  $auto_upgrades_config  = "APT::Periodic::Update-Package-Lists \"1\";\nAPT::Periodic::Unattended-Upgrade \"1\";"
}
