class { 'apache':
  mpm_module    => event,
  default_vhost => false,
}

file { '/var/www':
  ensure  => directory,
  owner   => $user,
  group   => $group,
  recurse => true,
}

# Set up Apache vHost for html serving if somebody queries it via web browser.
apache::vhost { 'generic landing page':
  servername      => $mainDomain,
  port            => '80',
  docroot         => "/var/www/${mainDomain}",
  docroot_owner   => $user,
  docroot_group   => $group,
  override        => ['all'],
}

# Set up Apache vHost for serving files via http for TFTP.
apache::vhost { 'generic landing page':
  servername      => $mainDomain,
  port            => '80',
  docroot         => "/var/www/${mainDomain}",
  docroot_owner   => $user,
  docroot_group   => $group,
  override        => ['all'],
}

# If SSL toggle is enabled process the below
if $sslToggle {
  apache::vhost { 'ssl generic landing page':
    servername      => $mainDomain,
    port            => '443',
    docroot         => "/var/www/${mainDomain}",
    docroot_owner   => $user,
    docroot_group   => $group,
    override        => ['all'],
  }
  apache::vhost { 'ssl generic landing page':
    servername      => $mainDomain,
    port            => '443',
    docroot         => "/var/www/${mainDomain}",
    docroot_owner   => $user,
    docroot_group   => $group,
    override        => ['all'],
  }
}

