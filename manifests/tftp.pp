file { '/opt/tftp':
  ensure => directory,
}

class tftp {
  directory => '/opt/tftp',
  address   => $::ipaddress,
  options   => '--ipv6 --timeout 60',
}
