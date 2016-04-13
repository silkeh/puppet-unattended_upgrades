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

  # Default origins pattern
  $origins = $::lsbdistid ? {
    'debian' => $::lsbdistcodename ? {
      'wheezy' => ['origin=Debian,archive=oldstable,label=Debian-Security'],
      default  => ['origin=Debian,codename=${distro_codename},label=Debian-Security'],
    },
    default  => [],
  }

  # Other parameters
  $mail                  = 'root'
  $unattended_upgrades_f = "${apt_conf_d}/50unattended-upgrades"
  $auto_upgrades_f       = "${apt_conf_d}/20auto-upgrades"
  $update_package_list   = '1'
  $unattended_upgrade    = '1'
}
