# Manage NTP on CentOS and Ubuntu Hosts
$ntp_conf = @(END) 
#Managed by Puppet 
server 192.168.0.3 iburst prefer 
server us.pool.ntp.org
driftfile /var/lib/ntp/drift
END

case $facts['os']['family']{
  'redhat': {
    $ntp_service = 'ntpd'
    $admingroup = 'wheel'
   }
  'debian': {
    $ntp_service = 'ntp'
    $admingroup = 'sudo'
   }
   default: {
     fail("FAILED: ${facts['os']['family']} is not supported!")
   }  
}

package { 'ntp' :
  before => File['/etc/ntp.conf'],
}

File {
  ensure => 'file',
  owner  => 'root',
  group  => $admingroup,
  mode   => '0664',
}

Service {
  ensure => 'running',
  enable => true,
}

file { '/etc/ntp.conf':
  content => $ntp_conf, 
  notify  => Service['NTPService'],
}

service { 'NTPService':
  name      => $ntp_service,
  subscribe => File['/etc/ntp.conf'],
}

