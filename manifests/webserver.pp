class quickdemo::webserver {

  class { 'apache': }

  file { '/var/www/html/index.html':
    ensure  => file,
    owner   => 'apache',
    group   => 'apache',
    mode    => '0755',
    content => template('quickdemo/index.erb'),
  }
}
