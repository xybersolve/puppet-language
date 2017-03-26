$osFamily = $facts['os']['family']

if $osFamily == 'RedHa' {
  notify { 'Red Hat' : }
} elsif $osFamily == 'Debia' {
  notify { 'Debian' : }
}  else {
  fail ("${osFamily} is not supported.") 
}


