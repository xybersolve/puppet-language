#notify { "${facts['os']}" : }
# double quotes enables interpretation in Heredoc
$display = @("END")

Family: ${facts['os']['family']}
OS: ${facts['os']['name']}
Version: ${facts['os']['release']['full']}

END

notify { $display : }

