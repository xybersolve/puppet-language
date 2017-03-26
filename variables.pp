# Hash Array
$user = {
  'name' => 'bob',
  'uid'  => '2011',
}  

notify { "This is the user name ${user['name']}": }

# String 
$ntp_service = 'ntpd'
# not in a string
notify { $ntp_service: }
# variable in a string (note double quotes)
notify { "this is a String ${ntp_service}": }

# Array 
$numbers = ['one','two','three']
notify { "Number in second element: ${numbers[2]}":  } 

# Heredoc
$ntp_conf = @(END)
driftfile /var/lib/ntp/driftfile
server tock prefer iburst
server us.pool.ntp.org
END

notify {$ntp_conf: }

$admingroups = ['wheel','adm', true, 10]

notify { $admingroups[1]: }
notify { "This is the wheel: ${admingroups[0]}": }


notify { $user['name']: }
notify { "This is bobs uid: ${user['uid']}": }


