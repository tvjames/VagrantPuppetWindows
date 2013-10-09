class software {
  file { ['c:/temp/', 'c:/temp/puppet_managed/', 'c:/temp/puppet_managed/installers/']:
    ensure => 'directory',
  }
}
