# Manage NTP on CentOS and Ubuntu Hosts
$ntp_conf = @(END) 
#Managed by Puppet 
server 192.168.0.3 iburst prefer 
server us.pool.ntp.org
driftfile /var/lib/ntp/drift
END

$ntp_service = 'ntpd'
$admingroup = 'wheel'

package { 'ntp' : }

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
}

service { 'NTPService':
  name => $ntp_service,
}

