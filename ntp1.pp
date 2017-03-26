$ntp_conf = '#Manged by Puppet 
server 192.168.0.3 iburst 
driftfile /var/lib/ntp/drift
'

package { 'ntp' :
  before => File['/etc/ntp.conf'],
}

file { '/etc/ntp.conf':
    ensure => 'file',
   content => $ntp_conf,  # reference to variable
     owner => 'root',
     group => 'wheel',
      mode => '0664',   
   require => Package['ntp'],
    before => Service['NTPService'],
}

service { 'NTPService':
     ensure => 'running',
     enable => true,
      name  => 'ntpd',
    require => File['/etc/ntp.conf'], 
}



