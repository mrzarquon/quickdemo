class quickdemo::master {

  file { '/etc/puppetlabs/puppet/autosign.conf':
    ensure  => file,
    owner   => pe-puppet,
    group   => pe-puppet,
    mode    => 0644,
    content => "*",
  }

  file { '/etc/puppetlabs/puppet/manifests/site.pp':
    ensure => file,
    owner  => pe-puppet,
    group  => pe-puppet,
    mode   => 0644,
    source => 'puppet:///modules/quickdemo/site.pp',
  }

  file { '/etc/puppetlabs/puppet/hiera.yaml':
    ensure => file,
    owner  => pe-puppet,
    group  => pe-puppet,
    mode   => 0644,
    source => 'puppet:///modules/quickdemo/hiera.yaml',
    notify => Service['pe-httpd'],
  }

  file { '/etc/puppetlabs/puppet/data':
    ensure => directory,
    owner  => pe-puppet,
    group  => pe-puppet,
    mode   => 0644,
  }

  file { '/etc/puppetlabs/puppet/data/common.yaml':
    ensure => file,
    owner  => pe-puppet,
    group  => pe-puppet,
    mode   => 0644,
    source => 'puppet:///modules/quickdemo/common.yaml',
  }

  file { '/etc/puppetlabs/puppet/data/roles':
    ensure => directory,
    owner  => pe-puppet,
    group  => pe-puppet,
    mode   => 0644,
  }

  file { '/etc/puppetlabs/puppet/data/roles/webserver.yaml':
    ensure => file,
    owner  => pe-puppet,
    group  => pe-puppet,
    mode   => 0644,
    source => 'puppet:///modules/quickdemo/webserver.yaml',
  }

  service { 'pe-httpd':
    ensure => running,
  }

}
