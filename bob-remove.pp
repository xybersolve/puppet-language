user { 'bob' :
  managehome => true,
  ensure     => absent,
}

group { 'it' :
  ensure => absent,
}

