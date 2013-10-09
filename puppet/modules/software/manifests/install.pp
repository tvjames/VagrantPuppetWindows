# define for software install
define software::install (
  $source,
  $name              = $title,
  $guid_x86          = $title,
  $guid_x64          = $title,
  $install_options   = undef,
  $uninstall_options = undef,
  $ensure            = "present",
) {
  include software

  case $architecture {
    x86: {$guid = $guid_x86}
    x64: {$guid = $guid_x64}
    default: { fail("Unrecognized architecture: ${architecture}") }
  }

  file { "${title}_source_file" :
    path    => "c:/temp/puppet_managed/installers/${name}",
    recurse => true,
    ensure  => "present",
    owner   => 'Administrator',
    group   => 'Administrators',
    source  => $source,
    mode    => 0775,
  }

  package { "${title}_package" :
    ensure            => $ensure,
    name              => $guid,
    provider          => 'windows',
    source            => "c:\\temp\\puppet_managed\\installers\\${name}",
    install_options   => $install_options,
    uninstall_options => $uninstall_options,
  }

  File ["${title}_source_file"] -> Package ["${title}_package"]
}