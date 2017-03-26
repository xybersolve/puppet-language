user { 'bob' :
  managehome => true,
  ensure     => present,
  gid        => 'it',
  password   => pw_hash('password', 'SHA-512', 'random'),
}

group { 'it' :
  ensure => present,
}


